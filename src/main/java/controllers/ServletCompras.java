package controllers;

import entities.Producto;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import service.IProductoService;

public class ServletCompras extends HttpServlet {

    @Inject
    private IProductoService productoService;

    private final List<String> errores = new ArrayList();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();
        String path = "registrarCompra.jsp";

        session.setAttribute("productos", productoService.getProducts());
        session.setAttribute("categorias", productoService.getTypeProducts());
        
        response.sendRedirect(path);

//        String idProducto;
//        
//        String accion = request.getParameter("accion");
//        
//
//        if (accion != null) {
//            switch (accion) {
//                case "producto":
//                    List<Producto> listaProductos = productoService.getProducts();
//                    session.setAttribute("productos", listaProductos);
//                    path = "productos.jsp";
//                    break;
//                case "tipoProducto":
//                    session.setAttribute("categorias", productoService.getTypeProducts());
//                    path = "agregarProducto.jsp";
//                    break;
//                default:
//                    break;
//
//            }
//
//        }
        

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

}
