/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBContext;

import entity.Blog;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Ottelia
 */
public class BlogDAO extends DBcontext {

    public ArrayList<Blog> getHotBlogs() {
        //Product with most amount
        ArrayList<Blog> hotBlogList = new ArrayList<>();
        String query = "select top 3 * from Blog\n"
                + "order by id desc";
        try {

            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                hotBlogList.add(new Blog(rs.getInt("ID"), rs.getString("Author"), rs.getString("Title"), rs.getString("Content"), rs.getString("imageLink")));
            }
        } catch (Exception e) {

        }
        return hotBlogList;
    }

    public ArrayList<Blog> getAllBlogs() {
        ArrayList<Blog> blogList = new ArrayList<>();
        String query = "select * from Blog  ";
        try {

            
          
          PreparedStatement  ps = connection.prepareStatement(query);
          ResultSet  rs = ps.executeQuery();
            while (rs.next()) {
                blogList.add(new Blog(rs.getInt("ID"), rs.getString("Author"), rs.getString("Title"), rs.getString("Content"), rs.getString("imageLink")));
            }
        } catch (SQLException e) {
            
        }
       
        return blogList;
    }

    public Blog getBlogByID(int id) {
       String query = "SELECT * FROM Blog WHERE ID = ?";
        try {
        
         PreparedStatement   ps = connection.prepareStatement(query);
            ps.setInt(1, id);
           ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Blog(rs.getInt("ID"), rs.getString("Author"), rs.getString("Title"), rs.getString("Content"), rs.getString("imageLink"));
            }
        } catch (SQLException e) {
        }
       
        return null;
    }

    public void add(String author, String title, String content, String imageLink) {
       String query = "INSERT INTO Blog VALUES (?,?,?,?)";
        try {
         
           PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, author);
            ps.setString(2, title);
            ps.setString(3, content);
            ps.setString(4, imageLink);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
       
    }

    public void update(String author, String title, String content, String imageLink, int id) {
       String query = "update Blog set Author= ? , Title =?, Content= ?, imageLink= ?  where ID =?";
        try {
            
          PreparedStatement  ps = connection.prepareStatement(query);
            ps.setString(1, author);
            ps.setString(2, title);
            ps.setString(3, content);
            ps.setString(4, imageLink);
            ps.setInt(5, id);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void delete(int id) {
      String  query = "Delete FROM Blog WHERE ID = ?";

        try {
            
       PreparedStatement     ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
       
    }
}
