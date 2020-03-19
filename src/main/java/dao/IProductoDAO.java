
package dao;

import entities.Producto;
import entities.Tipoproducto;
import java.util.List;


public interface IProductoDAO {
    
    public List<Producto> getProducts();
    
    public List<Tipoproducto> getTypeProducts();
    
    public Tipoproducto getCategoryById(Tipoproducto tipoProducto);
    
    public Producto getProductById(Producto producto);
    
    public void updateProduct(Producto producto);
    
    public void deleteProduct(Producto producto);
    
}
