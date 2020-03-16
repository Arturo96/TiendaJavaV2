
package service;

import dao.IUsuarioDAO;
import entities.Usuario;
import java.util.List;
import javax.ejb.Stateless;
import javax.inject.Inject;

@Stateless
public class UsuarioServiceImpl implements IUsuarioService {
    
    @Inject
    private IUsuarioDAO usuariodao;

    @Override
    public List<Usuario> getUsers() {
        return usuariodao.getUsers();
    }

    @Override
    public Usuario getUserByCredentials(Usuario usuario) {
        return usuariodao.getUserByCredentials(usuario);
    }

    @Override
    public void updateUser(Usuario usuario) {
        usuariodao.updateUser(usuario);
    }

    @Override
    public void deleteUser(Usuario usuario) {
        usuariodao.deleteUser(usuario);
    }
    
}
