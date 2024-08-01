/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBContext;

import entity.Brand;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class BrandDAO extends DBcontext {
 
    public ArrayList<Brand> getAllBrand() {
        ArrayList<Brand> list = new ArrayList<>();
        try {
           String query = "SELECT * FROM dbo.Brand";
           
          PreparedStatement  ps = connection.prepareStatement(query);
           ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Brand(rs.getInt("BrandID"),rs.getString("BrandName")));
            }
        } catch (SQLException e) {
            Logger.getLogger(BrandDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        
        return list;
    }
}
