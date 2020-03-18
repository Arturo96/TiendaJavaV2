
package service;

import entities.Producto;
import java.util.List;
import javax.ejb.Local;

@Local
public interface IProductoService {
    
    public List<Producto> getProducts();
    
    public Producto getProductById(Producto producto);
    
    public void updateProduct(Producto producto);
    
    public void deleteProduct(Producto producto);
    
}
