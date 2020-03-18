
package dao;

import entities.Producto;
import java.util.List;


public interface IProductoDAO {
    
    public List<Producto> getProducts();
    
    public Producto getProductById(Producto producto);
    
    public void updateProduct(Producto producto);
    
    public void deleteProduct(Producto producto);
    
}
