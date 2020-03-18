
package controllers;

import entities.Imagen;
import java.io.IOException;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.IImagenService;

@WebServlet(name = "ServletCargarImagen", urlPatterns = {"/ServletCargarImagen"})
public class ServletCargarImagen extends HttpServlet {

    @Inject
    private IImagenService imagenService;
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String idString = request.getParameter("id");
        Integer id = Integer.parseInt(idString);
        
        Imagen imagen = imagenService.getImagenById(new Imagen(id));
        byte[] foto = imagen.getFoto();
        
        response.getOutputStream().write(foto);
        
    }

}
