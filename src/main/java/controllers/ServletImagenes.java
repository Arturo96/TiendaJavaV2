package controllers;

import entities.Imagen;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import service.IImagenService;

public class ServletImagenes extends HttpServlet {

    @Inject
    private IImagenService imagenService;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        // Insertar la imagen a la BD
        
//        String path = "/home/arturo-soporte/banner-left.png";
//
//        Imagen imagen = new Imagen();
//
//        File file = new File(path); //asociamos el archivo fisico
//        InputStream input = new FileInputStream(file); //lo abrimos. Lo importante es que sea un InputStream
//        byte[] buffer = new byte[(int) file.length()]; //creamos el buffer
//        int readers = input.read(buffer); //leemos el archivo al buffer
//        imagen.setFoto(buffer); //lo guardamos en la entidad
//
//        imagenService.insertImage(imagen); //y lo colocamos en el EntityManager

        // Mostrar la imagen de la BD
        
        Imagen imagen = imagenService.getImagenById(new Imagen(1));
        
        HttpSession session = request.getSession();
        
        session.setAttribute("imagen", imagen);
        
        response.sendRedirect("imagenes.jsp");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
