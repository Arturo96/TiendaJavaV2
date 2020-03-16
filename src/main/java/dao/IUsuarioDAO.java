
package dao;

import entities.Usuario;
import java.util.List;

public interface IUsuarioDAO {
    
    public List<Usuario> getUsers();
    
    public Usuario getUserByCredentials(Usuario usuario);
    
    public void updateUser(Usuario usuario);
    
    public void deleteUser(Usuario usuario);
    
}
