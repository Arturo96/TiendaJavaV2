
package dao;

import entities.Usuario;
import java.util.List;
import javax.annotation.Resource;
import javax.ejb.SessionContext;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

@Stateless
public class UsuarioImpl implements IUsuarioDAO {

    @PersistenceContext(unitName = "TiendaPU")
    EntityManager em;
    
    @Resource
    private SessionContext context;
    
    @Override
    public List<Usuario> getUsers() {
        return em.createNamedQuery("Usuario.findAll").getResultList();
    }

    @Override
    public Usuario getUserByCredentials(Usuario usuario) {
        Query query = em.createNamedQuery("Usuario.findByCredentials");
        query.setParameter("username", usuario.getUsername());
        query.setParameter("password", usuario.getPassword());
        
        try {
            Usuario usuarioEncontrado = (Usuario) query.getSingleResult();        
            return usuarioEncontrado;
        } catch(Throwable t) {
            context.setRollbackOnly();
            return null;
        }
        
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
