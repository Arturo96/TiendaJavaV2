package controllers;

import entities.Producto;
import entities.Tipoproducto;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import service.IProductoService;

public class ServletEditarProducto extends HttpServlet {

    @Inject
    private IProductoService productoService;

    private final List<String> errores = new ArrayList();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String path = "editarProducto.jsp";

        int idProducto = 0;
        int idTipoProducto = 0;
        String modelo = null;
        String marca = null;
        String descripcion = null;
        double precio = 0;
        int cantidadInv = 0;
        int mesesGarantia = 0;
        byte[] buffer = null;

        // Arreglo de errores
        errores.clear();

        FileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);

        // req es la HttpServletRequest que recibimos del formulario.
        // Los items obtenidos serán cada uno de los campos del formulario,
        // tanto campos normales como ficheros subidos.
        List items;
        try {
            items = upload.parseRequest(request); // arreglo de elementos del formulario

            // Validar campos
            for (Object item : items) {
                FileItem uploaded = (FileItem) item;

                // Hay que comprobar si es un campo de formulario. Si no lo es, se guarda el fichero
                // subido donde nos interese
                if (!uploaded.isFormField()) {

                    // Imagen
                    // Si ingresaron una imagen
                    if (uploaded.getName().length() > 0) {

                        String rutaImagen = "/tmp/" + uploaded.getName();

                        File fichero = new File(rutaImagen);
                        if (fichero.exists()) {
                            fichero.delete();
                        }
                        uploaded.write(fichero);

                        InputStream input = new FileInputStream(fichero); //lo abrimos. Lo importante es que sea un InputStream
                        buffer = new byte[(int) fichero.length()]; //creamos el buffer
                        int readers = input.read(buffer); //leemos el archivo al buffer
                    }

                } else {
                    // es un campo de formulario, podemos obtener clave y valor
                    String key = uploaded.getFieldName();
                    // Codificamos el valor en UTF-8 para posteriormente recibirlo
                    String valor = new String(uploaded.getString().getBytes("iso-8859-1"), "UTF-8");

                    switch (key) {

                        // Id del Producto
                        case "idProducto":
                            String idProductoString = valor;
                            if (isNumeric(idProductoString, false)) {
                                idProducto = Integer.parseInt(idProductoString);
                            }
                            break;

                        // Tipo de producto
                        case "tipoProducto":
                            String tipoProductoString = valor;
                            if (isNumeric(tipoProductoString, false)) {
                                idTipoProducto = Integer.parseInt(tipoProductoString);
                                Tipoproducto categoria = productoService.getCategoryById(new Tipoproducto(idTipoProducto));
                                if (idTipoProducto <= 0 || categoria == null) {
                                    errores.add("Ingresa un tipo de producto válido.");
                                }
                            } else {
                                errores.add("Ingresa un tipo de producto válido.");
                            }
                            break;

                        case "modelo":

                            // Modelo
                            modelo = valor;
                            if (modelo.length() == 0) {
                                errores.add("Debes ingresar el modelo.");
                            }
                            break;

                        case "marca":

                            // Marca
                            marca = valor;
                            if (marca.length() == 0) {
                                errores.add("Debes ingresar la marca.");
                            }

                            break;

                        case "descripcion":
                            // descripcion
                            descripcion = valor;
                            descripcion = descripcion.replace("\r\n", "<br>");
                            break;

                        case "precio":
                            // Precio
                            String precioString = valor;
                            if (validarDatosNumericos(precioString, "precio", true)) {
                                precio = Double.parseDouble(precioString);
                            }

                            break;

                        case "cantidadInv":

                            // Cantidad en Inventario
                            String cantidadInvString = valor;
                            if (validarDatosNumericos(cantidadInvString, "inventario", false)) {
                                cantidadInv = Integer.parseInt(cantidadInvString);
                            }

                            break;

                        case "mesesGarantia":

                            // Tiempo de garantía
                            String mesesGarantiaString = valor;
                            if (validarDatosNumericos(mesesGarantiaString, "garantia", false)) {
                                mesesGarantia = Integer.parseInt(mesesGarantiaString);
                            }
                            break;

                    }

                }
            }
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        }

        HttpSession session = request.getSession();

        // Validar si hubieron errores
        if (errores.size() > 0) {
            session.setAttribute("errores", errores);
        } else {
            // Actualizamos el producto en la base de datos

            Tipoproducto tp = productoService.getCategoryById(new Tipoproducto(idTipoProducto));

            Producto producto;

            if (idProducto > 0) {
                if (buffer == null) {
                    Producto productoExistente = productoService.getProductById(new Producto(idProducto));
                    
                    producto = new Producto(idProducto, modelo, productoExistente.getImagen(), marca, descripcion,
                            precio, cantidadInv, mesesGarantia, new Date(), tp);
                    
                   
                } else {
                    producto = new Producto(idProducto, modelo, buffer, marca, descripcion,
                            precio, cantidadInv, mesesGarantia, new Date(), tp);
                }

                productoService.updateProduct(producto);

                session.setAttribute("productos", productoService.getProducts());
                path = "productos.jsp";
            }

        }

        response.sendRedirect(path);

    }

    protected boolean isNumeric(String dato, boolean esPrecio) {
        int numeroEntero;
        double numeroDecimal;
        try {
            if (esPrecio) {
                numeroDecimal = Double.parseDouble(dato);
            } else {
                numeroEntero = Integer.parseInt(dato);
            }
            return true;
        } catch (NumberFormatException ex) {
            return false;
        }

    }

    protected boolean validarDatosNumericos(String dato, String campo, boolean esPrecio) {

        String error;

        if (isNumeric(dato, esPrecio)) {
            if (campo.equals("precio")) {
                double precio = Double.parseDouble(dato);
                if (precio < 100) {
                    errores.add("Ingresa una cantidad de precio válida.");
                    return false;
                }
                return true;
            } else {
                int cantidad = Integer.parseInt(dato);
                if (cantidad < 0) {
                    switch (campo) {
                        case "inventario":
                            error = "Ingresa una cantidad válida de inventario.";
                            break;
                        default:
                            error = "Ingresa una cantidad válida de tiempo en garantía.";
                            break;
                    }
                    errores.add(error);
                    return false;
                }
                return true;
            }

        } else { // Si el dato no es un numero
            switch (campo) {
                case "precio":
                    error = "Ingresa un precio en formato válido.";
                    break;
                case "inventario":
                    error = "Ingresa una cantidad en inventario en formato válido.";
                    break;
                case "garantia":
                    error = "Ingresa una cantidad de tiempo en garantía en formato válido.";
                    break;
                default:
                    error = "Error default";
                    break;
            }
            errores.add(error);
            return false;
        }

    }

}
