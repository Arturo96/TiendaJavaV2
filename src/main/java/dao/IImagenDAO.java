
package dao;

import entities.Imagen;
import entities.Producto;
import java.util.List;


public interface IImagenDAO {
    
    public List<Imagen> getImagenes();
    
    public Imagen getImagenById(Imagen imagen);
    
    public void insertImage(Imagen imagen);
    
}
