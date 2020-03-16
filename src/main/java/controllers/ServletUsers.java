package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ServletUsers extends HttpServlet {

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
                session.setAttribute("userLogged", accion);
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
