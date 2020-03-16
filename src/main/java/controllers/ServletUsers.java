package controllers;

import entities.Cliente;
import entities.Empleado;
import entities.Usuario;
import java.io.IOException;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import service.IUsuarioService;

public class ServletUsers extends HttpServlet {
    
    @Inject
    private IUsuarioService usuarioService;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        String accion = request.getParameter("btnAccion");

        if (accion != null) {
            HttpSession session = request.getSession();

            if (accion.equals("signIn")) {
                
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                
                Usuario usuario = usuarioService.getUserByCredentials(new Usuario(username, password, null));
                
                if(usuario != null) {
                    session.setAttribute("userLogged", usuario);
                    session.setAttribute("rol", usuario.getRol().getNombre().toLowerCase());
                    
                    if(usuario.getCliente() != null) {
                        Cliente cliente = usuario.getCliente();
                        
                        session.setAttribute("persona", cliente.getNombres() + " "
                        + cliente.getApellidos());
                    } else if (usuario.getEmpleado() != null) {
                        Empleado empleado = usuario.getEmpleado();
                        
                        session.setAttribute("persona", empleado.getNombres() + " "
                        + empleado.getApellidos());
                    }
                    
                } else {
                    session.setAttribute("errorLogin", "login");
                }

                
            } else {
                session.setAttribute("userLogged", null);
            }

        }

        String path = "index.jsp";

        response.sendRedirect(path);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
