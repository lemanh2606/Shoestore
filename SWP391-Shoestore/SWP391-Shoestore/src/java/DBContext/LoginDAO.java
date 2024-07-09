/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBContext;
import java.sql.SQLException;
import entity.Users;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class LoginDAO extends DBcontext {
   
    public Users login(String user, String pass){
        try {
            String query ="select * from Users where Username = ? and [Password] = ?";
         
          PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
          ResultSet  rs = ps.executeQuery();
            while(rs.next()){
                
                return new Users(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6));
            }
        } catch (SQLException e) {
        }
      
        return null;
    }
     public Users checkUserExist(String user){
        try {
            String query ="select * from Users where Username = ?";
          
          PreparedStatement  ps = connection.prepareStatement(query);
            ps.setString(1, user);
            
          ResultSet  rs = ps.executeQuery();
            while(rs.next()){
                
                return new Users(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6));
            }
        } catch (SQLException e) {
        }
        
        return null;
    }
    public void register(String user, String pass , String email){
         String query = "insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (?,?,?,3,1)";
             
                
        try {
          
          PreparedStatement  ps = connection.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.setString(3, email);
            ps.executeUpdate();
        } catch (SQLException e){
            
        }
       
       
    }
}
