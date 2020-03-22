package controllers;

import entities.Producto;
import java.io.IOException;
import java.io.PrintWriter;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.IProductoService;

public class ServletImagenes extends HttpServlet {

    @Inject
    private IProductoService productoService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idString = request.getParameter("id");
        if (idString.length() > 0 && isNumeric(idString)) {
            Integer id = Integer.parseInt(idString);
            
            Producto producto = productoService.getProductById(new Producto(id));
            byte[] imagen = producto.getImagen();
            response.getOutputStream().write(imagen);
        }

    }

    private boolean isNumeric(String dato) {
        try {
            int numero = Integer.parseInt(dato);
            return true;
        } catch (NumberFormatException ex) {
            return false;
        }
    }

}
