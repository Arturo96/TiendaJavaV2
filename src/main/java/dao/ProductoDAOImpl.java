package dao;

import entities.Producto;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class ProductoDAOImpl implements IProductoDAO {

    @PersistenceContext(unitName = "TiendaPU")
    EntityManager em;

    @Override
    public List<Producto> getProducts() {
        return em.createNamedQuery("Producto.findAll").getResultList();
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
