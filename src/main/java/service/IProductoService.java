package service;

import entities.Producto;
import entities.Tipoproducto;
import java.util.List;
import javax.ejb.Local;

@Local
public interface IProductoService {

    public List<Producto> getProducts();

    public List<Tipoproducto> getTypeProducts();

    public Producto getProductById(Producto producto);

    public Tipoproducto getCategoryById(Tipoproducto tipoProducto);

    public void addProduct(Producto producto);

    public void updateProduct(Producto producto);

    public void deleteProduct(Producto producto);

}
