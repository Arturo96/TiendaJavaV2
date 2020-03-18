package dao;

import entities.Imagen;
import entities.Producto;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class ImagenDAOImpl implements IImagenDAO {

    @PersistenceContext(unitName = "TiendaPU")
    EntityManager em;

    @Override
    public List<Imagen> getImagenes() {
        return em.createNamedQuery("Imagen.findAll").getResultList();
    }
    
    @Override
    public Imagen getImagenById(Imagen imagen) {
        return em.find(Imagen.class, imagen.getId());
    }
    
    @Override
    public void insertImage(Imagen imagen) {
        em.persist(imagen);
    }


    

}
