
package service;

import dao.IProductoDAO;
import entities.Producto;
import entities.Tipoproducto;
import java.util.List;
import javax.ejb.Stateless;
import javax.inject.Inject;

@Stateless
public class ProductoServiceImpl implements IProductoService{
    
    @Inject
    private IProductoDAO productodao;

    @Override
    public List<Producto> getProducts() {
        return productodao.getProducts();
    }
    
    @Override
    public List<Tipoproducto> getTypeProducts() {
        return productodao.getTypeProducts();
    }
    
    @Override
    public Tipoproducto getCategoryById(Tipoproducto tipoProducto) {
        return productodao.getCategoryById(tipoProducto);
    }

    @Override
    public Producto getProductById(Producto producto) {
        return productodao.getProductById(producto);
    }

    @Override
    public void addProduct(Producto producto) {
        productodao.addProduct(producto);
    }
    
    @Override
    public void updateProduct(Producto producto) {
        productodao.updateProduct(producto);
    }

    @Override
    public void deleteProduct(Producto producto) {
        productodao.deleteProduct(producto);
    }


    
}
