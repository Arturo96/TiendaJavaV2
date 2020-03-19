package controllers;

import entities.Tipoproducto;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import service.IProductoService;

@WebServlet(name = "ServletProductos", urlPatterns = {"/ServletProductos"})
public class ServletProductos extends HttpServlet {

    @Inject
    private IProductoService productoService;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        HttpSession session = request.getSession();

        String accion = request.getParameter("accion");
        String path = "index.jsp";

        if (accion != null) {
            switch (accion) {
                case "producto":
                    session.setAttribute("productos", productoService.getProducts());
                    path = "productos.jsp";
                    break;
                case "tipoProducto":
                    session.setAttribute("categorias", productoService.getTypeProducts());
                    path = "agregarProducto.jsp";
                    break;
                default: 
                    break;
                    
            }

        } 
        
        response.sendRedirect(path);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
       
        String path = "agregarProducto.jsp";
        
        // Arreglo de errores
        
        List<String> errores = new ArrayList();
        
        // Validar campos
        
        // Tipo de producto
        
        String tipoProductoString = request.getParameter("tipoProducto");
        int idTipoProducto;
        if (isNumeric(tipoProductoString)) {
            idTipoProducto = Integer.parseInt(tipoProductoString);
            Tipoproducto categoria = productoService.getCategoryById
                                        (new Tipoproducto(idTipoProducto));
            if (idTipoProducto <= 0 || categoria == null) {
                errores.add("Ingresa un tipo de producto válido.");
            } 
        } else {
            errores.add("Ingresa un tipo de producto válido.");
        }
        
        HttpSession session = request.getSession();
        
        // Validar si hubieron errores
        
        if (errores.size() > 0) {
            session.setAttribute("errores", errores);
        }
        
        response.sendRedirect(path);
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
    public boolean isNumeric(String dato) {
        int numero;
        try {
            numero = Integer.parseInt(dato);
            return true;
        } catch (NumberFormatException ex) {
            return false;
        }
        
    }

}
