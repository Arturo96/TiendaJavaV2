
package service;

import entities.Usuario;
import java.util.List;
import javax.ejb.Local;

@Local
public interface IUsuarioService {
    
    public List<Usuario> getUsers();
    
    public Usuario getUserByCredentials(Usuario usuario);
    
    public void updateUser(Usuario usuario);
    
    public void deleteUser(Usuario usuario);
    
}
