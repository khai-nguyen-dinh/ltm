/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.codejava.spring.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.sql.DataSource;
import net.codejava.spring.model.Post;
import net.codejava.spring.model.User;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author khai
 */
public class UpDAOImpl implements UpDAO{
    private JdbcTemplate jdbcTemplate;

    public UpDAOImpl() {
        super();
    }

    public UpDAOImpl(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }

    @Override
    public void save(User user) {
        String sql = "INSERT INTO User (id, address, fullname, username, password)"
                + " VALUES (?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, user.getId(), user.getAddress(),
                user.getFullname(), user.getUsername(),user.getPassword());
    }

    @Override
    public User checkUsername(String username) {
        String sql = "SELECT * FROM User WHERE username='" + username + "'";
        return jdbcTemplate.query(sql, new ResultSetExtractor<User>() {

            @Override
            public User extractData(ResultSet rs) throws SQLException,
                    DataAccessException {
                if (rs.next()) {
                    User user = new User();
                    user.setId(rs.getInt("id"));
                    user.setFullname(rs.getString("fullname"));
                    user.setUsername(rs.getString("username"));
                    user.setAddress(rs.getString("address"));
                    user.setPassword(rs.getString("password"));
                    return user;
                }

                return null;
            }

        });
    }

    @Override
    public User doLogin(String username, String password) {
        String sql = "SELECT * FROM User WHERE username='" + username + "' and password='" + password + "'";
        return jdbcTemplate.query(sql, new ResultSetExtractor<User>() {

            @Override
            public User extractData(ResultSet rs) throws SQLException,
                    DataAccessException {
                if (rs.next()) {
                    User user = new User();
                    user.setId(rs.getInt("id"));
                    user.setFullname(rs.getString("fullname"));
                    user.setUsername(rs.getString("username"));
                    user.setAddress(rs.getString("address"));
                    user.setPassword(rs.getString("password"));
                    return user;
                }

                return null;
            }

        });
    }

    @Override
    public void savePost(Post post) {
        String sql = "INSERT INTO Post (id, content, postedAt, author_id)"
                + " VALUES (?, ?, ?, ?)";
        jdbcTemplate.update(sql, post.getId(), post.getContent(), post.getPostedAt(), post.getAuthor_id());
    }

    @Override
    public void deletePost(int id) {
        String sql = "DELETE FROM Post WHERE id=?";
        jdbcTemplate.update(sql, id);
    }

    @Override
    public List<Post> list(int id) {
        String sql = "SELECT * FROM Post WHERE author_id=" + id;
        List<Post> listPost = jdbcTemplate.query(sql, new RowMapper<Post>() {

            @Override
            public Post mapRow(ResultSet rs, int rowNum) throws SQLException {
                Post aContact = new Post();

                aContact.setId(rs.getInt("id"));
                aContact.setContent(rs.getString("content"));
                aContact.setPostedAt(rs.getDate("postedAt"));
                aContact.setAuthor_id(rs.getInt("author_id"));

                return aContact;
            }

        });

        return listPost;
    }

    @Override
    public Post getPost(int id) {
        String sql = "SELECT * FROM Post WHERE id='" + id + "'";
        return jdbcTemplate.query(sql, new ResultSetExtractor<Post>() {

            @Override
            public Post extractData(ResultSet rs) throws SQLException,
                    DataAccessException {
                if (rs.next()) {
                    Post aContact = new Post();

                    aContact.setId(rs.getInt("id"));
                    aContact.setContent(rs.getString("content"));
                    aContact.setPostedAt(rs.getDate("postedAt"));
                    aContact.setAuthor_id(rs.getInt("author_id"));
                    return aContact;
                }

                return null;
            }

        });
    }

    @Override
    public void editPost(Post post) {
        String sql = "UPDATE Post Set content=?, postedAt=?, author_id=? WHERE id=?";
        jdbcTemplate.update(sql, post.getContent(), post.getPostedAt(), post.getAuthor_id(), post.getId());
    }

    @Override
    public User getUsername(int id) {
        String sql = "SELECT * FROM User WHERE id='" + id +  "'";
        return jdbcTemplate.query(sql, new ResultSetExtractor<User>() {

            @Override
            public User extractData(ResultSet rs) throws SQLException,
                    DataAccessException {
                if (rs.next()) {
                    User user = new User();
                    user.setId(rs.getInt("id"));
                    user.setFullname(rs.getString("fullname"));
                    user.setUsername(rs.getString("username"));
                    user.setAddress(rs.getString("address"));
                    user.setPassword(rs.getString("password"));
                    return user;
                }

                return null;
            }

        });
    }

    @Override
    public void updateUser(User user) {
        try{
            String sql = "UPDATE User Set username=?, password=?, fullname=? address=?";
            jdbcTemplate.update(sql, user.getUsername(), user.getPassword(), user.getFullname(), user.getAddress());
        }catch(Exception e){
            e.printStackTrace();
        }
        
    }

}
