
package data;

import entities.Usuario;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class UsuarioImpl implements IUsuarioDAO {

    @PersistenceContext(unitName = "TiendaPU")
    EntityManager em;
    
    @Override
    public List<Usuario> getUsers() {
        return em.createNamedQuery("Usuario.findAll").getResultList();
    }

    @Override
    public Usuario getUserByCredentials(Usuario usuario) {
        return (Usuario) em.createNamedQuery("Usuario.findByCredentials").getSingleResult();
    }

    @Override
    public void updateUser(Usuario usuario) {
        em.merge(usuario);
    }

    @Override
    public void deleteUser(Usuario usuario) {
        em.remove(em.merge(usuario));
    }
    
}
