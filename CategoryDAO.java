/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Model.Category;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author MSI
 */
public class CategoryDAO extends DBContext {
    // Get all category

    public List<Category> getAll() {
        List<Category> ls = new ArrayList<>();
        String sql = "SELECT [CategoryID]\n"
                + "      ,[CategoryName]\n"
                + "      ,[Description]\n"
                + "      ,[Status]\n"
                + "  FROM [dbo].[Category]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setCategoryID(rs.getInt("CategoryID"));
                c.setCategoryName(rs.getString("CategoryName"));
                c.setDescription(rs.getString("Description"));
                c.setStatus(rs.getString("Status"));
                ls.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return ls;
    }

    // Get Category By Name
    public Category getCategoryByID(int id) {
        String sql = "SELECT [CategoryID]\n"
                + "      ,[CategoryName]\n"
                + "      ,[Description]\n"
                + "      ,[Status]\n"
                + "  FROM [dbo].[Category] WHERE CategoryID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Category c = new Category();
                c.setCategoryID(rs.getInt("CategoryID"));
                c.setCategoryName(rs.getString("CategoryName"));
                c.setDescription(rs.getString("Description"));
                c.setStatus(rs.getString("Status"));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    // Delete category
    public void deleteCategory(int id) {
        String sql = "DELETE FROM [dbo].[Category]\n"
                + "      WHERE CategoryID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    // Add category
    public void insertCategory(Category c) {
        String sql = "INSERT INTO [dbo].[Category]\n"
                + "           ,[CategoryName]\n"
                + "           ,[Description]\n"
                + "           ,[Status])\n"
                + "     VALUES (?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, c.getCategoryName());
            st.setString(2, c.getDescription());
            st.setString(3, c.getStatus());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    // Update
    public void updateCategory(Category c) {
        String sql = "UPDATE [dbo].[Category]\n"
                + "   SET [CategoryID] = ?\n"
                + "      ,[CategoryName] = ?\n"
                + "      ,[Description] = ?\n"
                + "      ,[Status] = ?\n"
                + " WHERE [CategoryID] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, c.getCategoryName());
            st.setString(2, c.getDescription());
            st.setString(3, c.getStatus());
            st.setInt(4, c.getCategoryID());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
