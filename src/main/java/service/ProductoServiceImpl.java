
package service;

import dao.IProductoDAO;
import entities.Producto;
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
    public Producto getProductById(Producto producto) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void updateProduct(Producto producto) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void deleteProduct(Producto producto) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
