/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBContext;

import entity.Cart;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CartDAO extends DBcontext{
   
    public ArrayList<Cart> getCart(int id) {
        ArrayList<Cart> list = new ArrayList<>();
        try {
           String query = "SELECT Cart.ProductID,pro.ProductName,Cart.Amount,pro.SellPrice,pro.ProductImgURL FROM dbo.Cart JOIN (SELECT p.ProductID,MIN(p.ProductName) AS ProductName,MIN(p.Description) AS Description,MIN(p.OriginalPrice) AS OriginalPrice,MIN(p.SellPrice) AS SellPrice,MIN(p.SalePercent) AS SalePercent,MIN(p.SubCategoryID) AS SubCategoryID,MIN(p.SellerID) AS SellerID,MIN(p.Amount) AS Amount,MIN(p.StatusID) AS StatusID,MIN(p.BrandID) AS BrandID,MIN(p.height) AS height,MIN(p.width) AS width,MIN(p.weight) AS weight,MIN(ProI.ProductImgURL) AS ProductImgURL FROM dbo.Product p JOIN  dbo.ProductImg ProI ON ProI.ProductID = p.ProductID GROUP BY p.ProductID ) pro ON pro.ProductID = Cart.ProductID WHERE Cart.UserID = ?";
      
        PreparedStatement    ps = connection.prepareStatement(query);
            ps.setInt(1, id);
           ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Cart(rs.getInt("ProductID"), rs.getString("ProductName"), rs.getInt("Amount"),rs.getInt("SellPrice"),rs.getString("ProductImgURL")));
            }
        } catch (SQLException e) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }
    public int getCartAmount(int id) {
        int res= 0;
        try {
           String query = "SELECT Cart.ProductID,pro.ProductName,Cart.Amount,pro.SellPrice,pro.ProductImgURL FROM dbo.Cart JOIN (SELECT p.ProductID,MIN(p.ProductName) AS ProductName,MIN(p.Description) AS Description,MIN(p.OriginalPrice) AS OriginalPrice,MIN(p.SellPrice) AS SellPrice,MIN(p.SalePercent) AS SalePercent,MIN(p.SubCategoryID) AS SubCategoryID,MIN(p.SellerID) AS SellerID,MIN(p.Amount) AS Amount,MIN(p.StatusID) AS StatusID,MIN(p.BrandID) AS BrandID,MIN(p.height) AS height,MIN(p.width) AS width,MIN(p.weight) AS weight,MIN(ProI.ProductImgURL) AS ProductImgURL FROM dbo.Product p JOIN  dbo.ProductImg ProI ON ProI.ProductID = p.ProductID GROUP BY p.ProductID ) pro ON pro.ProductID = Cart.ProductID WHERE Cart.UserID = ?";
            
           PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                res+= rs.getInt("Amount");
            }
        } catch (SQLException e) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, e);
        }
       
        return res;
    }
    public void plusCart(int id,int productId) {
        try {
          String  query = "Update dbo.Cart Set Amount = Amount+1 Where UserID = ? And ProductID = ?";
           
          PreparedStatement  ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ps.setInt(2, productId);
            ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, e);
        }
       return;
    }
    public void minusCart(int id,int productId) {
        try {
          String  query = "Update dbo.Cart Set Amount = Amount-1 Where UserID = ? And ProductID = ?";
            
          PreparedStatement  ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ps.setInt(2, productId);
            ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        
        return;
    }
    public void deleteCart(int id,int productId) {
        try {
          String  query = "DELETE from dbo.Cart Where UserID = ? And ProductID = ?";
         
          PreparedStatement  ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ps.setInt(2, productId);
            ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        
        return;
    }
    public void removeCart(int id) {
        try {
            String query = "DELETE from dbo.Cart Where UserID = ?";
       
         PreparedStatement   ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, e);
        }
       
        return;
    }
    public void validCart() {
         try {
           String query = "DELETE FROM dbo.Cart WHERE Amount = 0";
           
           PreparedStatement ps = connection.prepareStatement(query);
            ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        
        return;
    }
    public void addToCart(int userId, int productId, int quantity) {
        // Your existing code to get a connection to the database

        try {
            // Check if the product is already in the cart
            String queryCheck = "SELECT Amount FROM Cart WHERE UserID = ? AND ProductID = ?";
            PreparedStatement psCheck = connection.prepareStatement(queryCheck);
            psCheck.setInt(1, userId);
            psCheck.setInt(2, productId);
            ResultSet rsCheck = psCheck.executeQuery();

            if (rsCheck.next()) {
                // If product is already in the cart, update the quantity
                int existingQuantity = rsCheck.getInt("Amount");
                String queryUpdate = "UPDATE Cart SET Amount = ? WHERE UserID = ? AND ProductID = ?";
                PreparedStatement psUpdate = connection.prepareStatement(queryUpdate);
                psUpdate.setInt(1, existingQuantity + quantity);
                psUpdate.setInt(2, userId);
                psUpdate.setInt(3, productId);
                psUpdate.executeUpdate();
            } else {
                // If product is not in the cart, insert a new record
                String queryInsert = "INSERT INTO Cart (UserID, ProductID, Amount) VALUES (?, ?, ?)";
                PreparedStatement psInsert = connection.prepareStatement(queryInsert);
                psInsert.setInt(1, userId);
                psInsert.setInt(2, productId);
                psInsert.setInt(3, quantity);
                psInsert.executeUpdate();
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } 
    }
}
