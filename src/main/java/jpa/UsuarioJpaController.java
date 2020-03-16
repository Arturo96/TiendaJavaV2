/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jpa;

import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import entities.Cliente;
import entities.Empleado;
import entities.Rol;
import entities.Usuario;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.transaction.UserTransaction;
import jpa.exceptions.NonexistentEntityException;
import jpa.exceptions.RollbackFailureException;

/**
 *
 * @author ARTURO-PC
 */
public class UsuarioJpaController implements Serializable {

    public UsuarioJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Usuario usuario) throws RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Cliente cliente = usuario.getCliente();
            if (cliente != null) {
                cliente = em.getReference(cliente.getClass(), cliente.getId());
                usuario.setCliente(cliente);
            }
            Empleado empleado = usuario.getEmpleado();
            if (empleado != null) {
                empleado = em.getReference(empleado.getClass(), empleado.getId());
                usuario.setEmpleado(empleado);
            }
            Rol rol = usuario.getRol();
            if (rol != null) {
                rol = em.getReference(rol.getClass(), rol.getId());
                usuario.setRol(rol);
            }
            em.persist(usuario);
            if (cliente != null) {
                Usuario oldUsuarioOfCliente = cliente.getUsuario();
                if (oldUsuarioOfCliente != null) {
                    oldUsuarioOfCliente.setCliente(null);
                    oldUsuarioOfCliente = em.merge(oldUsuarioOfCliente);
                }
                cliente.setUsuario(usuario);
                cliente = em.merge(cliente);
            }
            if (empleado != null) {
                Usuario oldUsuarioOfEmpleado = empleado.getUsuario();
                if (oldUsuarioOfEmpleado != null) {
                    oldUsuarioOfEmpleado.setEmpleado(null);
                    oldUsuarioOfEmpleado = em.merge(oldUsuarioOfEmpleado);
                }
                empleado.setUsuario(usuario);
                empleado = em.merge(empleado);
            }
            if (rol != null) {
                rol.getUsuarioList().add(usuario);
                rol = em.merge(rol);
            }
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Usuario usuario) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Usuario persistentUsuario = em.find(Usuario.class, usuario.getId());
            Cliente clienteOld = persistentUsuario.getCliente();
            Cliente clienteNew = usuario.getCliente();
            Empleado empleadoOld = persistentUsuario.getEmpleado();
            Empleado empleadoNew = usuario.getEmpleado();
            Rol rolOld = persistentUsuario.getRol();
            Rol rolNew = usuario.getRol();
            if (clienteNew != null) {
                clienteNew = em.getReference(clienteNew.getClass(), clienteNew.getId());
                usuario.setCliente(clienteNew);
            }
            if (empleadoNew != null) {
                empleadoNew = em.getReference(empleadoNew.getClass(), empleadoNew.getId());
                usuario.setEmpleado(empleadoNew);
            }
            if (rolNew != null) {
                rolNew = em.getReference(rolNew.getClass(), rolNew.getId());
                usuario.setRol(rolNew);
            }
            usuario = em.merge(usuario);
            if (clienteOld != null && !clienteOld.equals(clienteNew)) {
                clienteOld.setUsuario(null);
                clienteOld = em.merge(clienteOld);
            }
            if (clienteNew != null && !clienteNew.equals(clienteOld)) {
                Usuario oldUsuarioOfCliente = clienteNew.getUsuario();
                if (oldUsuarioOfCliente != null) {
                    oldUsuarioOfCliente.setCliente(null);
                    oldUsuarioOfCliente = em.merge(oldUsuarioOfCliente);
                }
                clienteNew.setUsuario(usuario);
                clienteNew = em.merge(clienteNew);
            }
            if (empleadoOld != null && !empleadoOld.equals(empleadoNew)) {
                empleadoOld.setUsuario(null);
                empleadoOld = em.merge(empleadoOld);
            }
            if (empleadoNew != null && !empleadoNew.equals(empleadoOld)) {
                Usuario oldUsuarioOfEmpleado = empleadoNew.getUsuario();
                if (oldUsuarioOfEmpleado != null) {
                    oldUsuarioOfEmpleado.setEmpleado(null);
                    oldUsuarioOfEmpleado = em.merge(oldUsuarioOfEmpleado);
                }
                empleadoNew.setUsuario(usuario);
                empleadoNew = em.merge(empleadoNew);
            }
            if (rolOld != null && !rolOld.equals(rolNew)) {
                rolOld.getUsuarioList().remove(usuario);
                rolOld = em.merge(rolOld);
            }
            if (rolNew != null && !rolNew.equals(rolOld)) {
                rolNew.getUsuarioList().add(usuario);
                rolNew = em.merge(rolNew);
            }
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = usuario.getId();
                if (findUsuario(id) == null) {
                    throw new NonexistentEntityException("The usuario with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(Integer id) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Usuario usuario;
            try {
                usuario = em.getReference(Usuario.class, id);
                usuario.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The usuario with id " + id + " no longer exists.", enfe);
            }
            Cliente cliente = usuario.getCliente();
            if (cliente != null) {
                cliente.setUsuario(null);
                cliente = em.merge(cliente);
            }
            Empleado empleado = usuario.getEmpleado();
            if (empleado != null) {
                empleado.setUsuario(null);
                empleado = em.merge(empleado);
            }
            Rol rol = usuario.getRol();
            if (rol != null) {
                rol.getUsuarioList().remove(usuario);
                rol = em.merge(rol);
            }
            em.remove(usuario);
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Usuario> findUsuarioEntities() {
        return findUsuarioEntities(true, -1, -1);
    }

    public List<Usuario> findUsuarioEntities(int maxResults, int firstResult) {
        return findUsuarioEntities(false, maxResults, firstResult);
    }

    private List<Usuario> findUsuarioEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Usuario.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public Usuario findUsuario(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Usuario.class, id);
        } finally {
            em.close();
        }
    }

    public int getUsuarioCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Usuario> rt = cq.from(Usuario.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
