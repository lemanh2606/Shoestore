/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBContext;

import entity.Notification;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author SAKURA
 */
public class NotificationDAO extends DBcontext{
   
    public void addNotification(Notification notification)  {
        try {
          String  query = "INSERT INTO dbo.[Notifications] VALUES (?,?,?,0,GETDATE())";
            
         PreparedStatement   ps = connection.prepareStatement(query);
            ps.setInt(1, notification.getUserID());
            ps.setInt(2,notification.getOrderID());
            ps.setNString(3, notification.getContent());
            ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(NotificationDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        
    }
    public ArrayList<Notification> getAllNotification(int id) {
        ArrayList<Notification> list = new ArrayList<>();
        try {
         String   query = "SELECT * FROM dbo.[Notifications] WHERE UserID = ? ORDER BY [status] ASC, [time] DESC";
          
          PreparedStatement  ps = connection.prepareStatement(query);
            ps.setInt(1, id);
           ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Notification(rs.getInt("ID"),rs.getInt("UserID"), rs.getInt("OrderID"), rs.getString("Content"), rs.getInt("status"), rs.getDate("time")));
            }
        } catch (SQLException e) {
            Logger.getLogger(NotificationDAO.class.getName()).log(Level.SEVERE, null, e);
        }
       
        return list;
    }
    public void markAsRead(int id,int notiId){
        try {
         String   query = "UPDATE dbo.Notifications set status=1 where UserID = ? and ID = ?";
           
          PreparedStatement  ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ps.setInt(2, notiId);
            ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(NotificationDAO.class.getName()).log(Level.SEVERE, null, e);
        }
       
    }
    public void readAll(int id){
        try {
          String  query = "UPDATE dbo.Notifications set status=1 where UserID = ?";
        
       PreparedStatement     ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(NotificationDAO.class.getName()).log(Level.SEVERE, null, e);
        }
       
    }
}
