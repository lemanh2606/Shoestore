/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Product;

/**
 *
 * @author chi
 */
public class ProductDAO extends DBContext {

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * from Product";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("ProductID"));
                p.setName(rs.getString("ProductName"));
                p.setDescription(rs.getString("Description"));
                p.setPrice(rs.getDouble("Price"));
                p.setCategoryID(rs.getInt("CategoryID"));
                p.setStockQuantity(rs.getInt("StockQuantity"));
                p.setImage(rs.getString("Image"));
                list.add(p);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;

    }
    public List<Product> getLastProduct(){
        List<Product> list = new ArrayList<>();
        String sql = "SELECT top 4 * FROM Product ORDER BY ProductID desc";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("ProductID"));
                p.setName(rs.getString("ProductName"));
                p.setDescription(rs.getString("Description"));
                p.setPrice(rs.getDouble("Price"));
                p.setCategoryID(rs.getInt("CategoryID"));
                p.setStockQuantity(rs.getInt("StockQuantity"));
                p.setImage(rs.getString("Image"));
                list.add(p);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
    
    public static void main(String[] args) {
        ProductDAO dao = new ProductDAO();
        List<Product>list = dao.getLastProduct();
        for(Product p : list){
            System.out.println(p);
        }
    }



}
