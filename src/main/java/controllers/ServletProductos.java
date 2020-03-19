package controllers;

import java.io.IOException;
import java.io.PrintWriter;
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
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
