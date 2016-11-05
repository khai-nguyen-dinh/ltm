package net.codejava.spring.dao;


import java.util.List;
import net.codejava.spring.model.Post;
import net.codejava.spring.model.User;

/**
 * Defines DAO operations for the contact model.
 *
 */
public interface UpDAO {

    public void save(User user);

    public User checkUsername(String username);
    public User getUsername(int id);
    public User doLogin(String usernam, String password);
    public void savePost(Post post);
    public void updateUser(User user);
    public void deletePost(int id);

    public List<Post> list(int id);

    public Post getPost(int id);

    public void editPost(Post post);
}
