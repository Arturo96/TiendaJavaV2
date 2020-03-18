
package service;

import dao.IImagenDAO;
import dao.IProductoDAO;
import entities.Imagen;
import entities.Producto;
import java.util.List;
import javax.ejb.Stateless;
import javax.inject.Inject;

@Stateless
public class ImagenServiceImpl implements IImagenService{
    
    @Inject
    private IImagenDAO imagendao;

    @Override
    public List<Imagen> getImagenes() {
        return imagendao.getImagenes();
    }

    @Override
    public Imagen getImagenById(Imagen imagen) {
        return imagendao.getImagenById(imagen);
    }
    
    @Override
    public void insertImage(Imagen imagen) {
        imagendao.insertImage(imagen);
    }


  
}
