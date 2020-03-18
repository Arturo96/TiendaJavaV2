
package service;

import entities.Imagen;
import entities.Producto;
import java.util.List;
import javax.ejb.Local;

@Local
public interface IImagenService {
    
    public List<Imagen> getImagenes();
    
    public Imagen getImagenById(Imagen imagen);
    
    public void insertImage(Imagen imagen);
    
}
