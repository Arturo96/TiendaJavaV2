package dao;

import entities.Producto;
import entities.Tipoproducto;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

@Stateless
public class ProductoDAOImpl implements IProductoDAO {

    @PersistenceContext(unitName = "TiendaPU")
    EntityManager em;

    @Override
    public List<Producto> getProducts() {
        return em.createNamedQuery("Producto.findAll").getResultList();
    }

    
    @Override
    public List<Tipoproducto> getTypeProducts() {
        return em.createNamedQuery("Tipoproducto.findAll").getResultList();
    }
    
    @Override
    public Tipoproducto getCategoryById(Tipoproducto tipoProducto) {
        return em.find(Tipoproducto.class, tipoProducto.getId());
    }
    
    @Override
    public Producto getProductById(Producto producto) {
        return null;
    }

    @Override
    public void updateProduct(Producto producto) {

    }

    @Override
    public void deleteProduct(Producto producto) {

    }



}
