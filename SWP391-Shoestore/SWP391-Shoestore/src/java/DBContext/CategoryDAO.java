/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBContext;

import entity.Category;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CategoryDAO extends DBcontext{
   
    public ArrayList<Category> getAllCategory() {
        ArrayList<Category> list = new ArrayList<>();
        try {
           String query = "SELECT * FROM dbo.Category";
            
           PreparedStatement ps = connection.prepareStatement(query);
          ResultSet  rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt("CategoryID"),rs.getString("CategoryName")));
            }
        } catch (SQLException e) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, e);
        }
       
        return list;
    }
}
