/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBContext;

import entity.CBanner;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CBannerDAO extends DBcontext{
   
 
    
    public CBanner getCBanner(int id)
    {
        CBanner cbanner = null;
        try {
          String  query = "SELECT * FROM dbo.CBanner WHERE ID = ?";
       
          PreparedStatement  ps = connection.prepareStatement(query);
            ps.setInt(1, id);
           ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                cbanner = new CBanner(rs.getInt("ID"),rs.getString("Img"),rs.getString("Title"),rs.getString("desc"));
            }
        } catch (SQLException e) {
            Logger.getLogger(CBanner.class.getName()).log(Level.SEVERE, null, e);
        }
        
        return cbanner;
    }
    public ArrayList<CBanner> getAllCBanner() {
        ArrayList<CBanner> list = new ArrayList<>();
        try {
           String query = "SELECT * FROM dbo.CBanner";
      
           PreparedStatement ps = connection.prepareStatement(query);
          ResultSet  rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new CBanner(rs.getInt("ID"),rs.getString("Img"),rs.getString("Title"),rs.getString("desc")));
            }
        } catch (SQLException e) {
            Logger.getLogger(CBanner.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }
    public void addCBanner(CBanner cbanner){
        try {
           String query = "INSERT INTO dbo.CBanner VALUES ( ? , ? , ? )"   ;
          
          PreparedStatement  ps = connection.prepareStatement(query);
            ps.setString(1, cbanner.getImg());
            ps.setNString(2, cbanner.getTitle());
            ps.setNString(3, cbanner.getDesc());
            ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(CBanner.class.getName()).log(Level.SEVERE, null, e);
        }
        
    }
    public void editCBanner(CBanner cbanner){
           try {
           String query = "UPDATE dbo.CBanner SET Img = ?,Title = ? , [desc] = ? WHERE ID = ?";
            
           PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, cbanner.getImg());
            ps.setNString(2, cbanner.getTitle());
            ps.setNString(3, cbanner.getDesc());
            ps.setInt(4, cbanner.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(CBanner.class.getName()).log(Level.SEVERE, null, e);
        }
        
    }
    public void deleteCBanner(int id){
        try {
           String query = "DELETE FROM dbo.CBanner WHERE ID = ?";
            
         PreparedStatement   ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(CBanner.class.getName()).log(Level.SEVERE, null, e);
        }
       
        
    }
}
