/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBContext;

import entity.Order;
import entity.OrderDetail;
import entity.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


public class OrderDetailDAO extends DBcontext{

   

    public int addOrderDetail(OrderDetail orderdetail) {
        try {
           
        PreparedStatement    ps = connection.prepareStatement("INSERT INTO dbo.Order_Detail (Order_ID,ProductID,ProductName,ProductPrice,Quantity) VALUES(?,?,?,?,?)");
            ps.setInt(1, orderdetail.getOrderID());
            ps.setInt(2, orderdetail.getProductID());
            ps.setNString(3, orderdetail.getProductName());
            ps.setDouble(4, orderdetail.getProductPrice());
            ps.setInt(5, orderdetail.getQuantity());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        } 
        return 0;
    }

    //LAMDTHE153097
    public List<OrderDetail> getOdByOrderId(int OrderId) {
        List<OrderDetail> od = new ArrayList<>();
        String query = "select o.ProductID, o.ProductName, p.ProductImgURL, o.ProductPrice, o.Quantity\n"
                + "from Order_Detail o inner join ProductImg p\n"
                + "on o.ProductID=p.ProductID\n"
                + "where o.Order_ID=?";
        try {
          
        PreparedStatement    ps = connection.prepareStatement(query);
            ps.setInt(1, OrderId);
          ResultSet  rs = ps.executeQuery();
            while (rs.next()) {
                od.add(new OrderDetail(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5)));
            }

        } catch (Exception e) {
        }
      
        return od;
    }
       public List<OrderDetail> getDetailByOrderId(int OrderId) {
        List<OrderDetail> od = new ArrayList<>();
        String query = " select o.Order_ID ,o.ProductID, o.ProductName, o.ProductPrice, o.Quantity\n" +
"                from Order_Detail o inner join  Orders od\n" +
"                on od.ID=o.Order_ID\n" +
"                where o.Order_ID=?";
        try {
           
           PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, OrderId);
           ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                od.add(new OrderDetail(rs.getInt("Order_ID"),rs.getInt("ProductID"),rs.getString("ProductName"),rs.getInt(4),rs.getInt(5)));
            }

        } catch (Exception e) {
        }
      
        return od;
    }
}
