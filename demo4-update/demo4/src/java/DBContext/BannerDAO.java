/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBContext;

import entity.Banner;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ChauBNMHE153019
 */
public class BannerDAO extends DBcontext {

    public Banner getBanner(int id) {
        Banner banner = null;
        String query = "SELECT * FROM dbo.Banner WHERE ID = ?";
        try {

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                banner = new Banner(rs.getInt("ID"), rs.getString("Img"));
            }
        } catch (SQLException e) {
            Logger.getLogger(BannerDAO.class.getName()).log(Level.SEVERE, null, e);
        }

        return banner;
    }

    public ArrayList<Banner> getAllBanner() {
        ArrayList<Banner> list = new ArrayList<>();
        String query = "SELECT * FROM dbo.Banner";
        try {

            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Banner(rs.getInt("ID"), rs.getString("Img")));
            }
        } catch (SQLException e) {
            Logger.getLogger(BannerDAO.class.getName()).log(Level.SEVERE, null, e);
        }

        return list;
    }

    public void addBanner(Banner banner) {
        String query = "INSERT INTO dbo.Banner VALUES ( ? )";
        try {

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, banner.getImg());
            ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(BannerDAO.class.getName()).log(Level.SEVERE, null, e);
        }

    }

    public void editBanner(Banner banner) {
        String query = "UPDATE dbo.Banner SET Img = ? WHERE ID = ?";
        try {

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, banner.getImg());
            ps.setInt(2, banner.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(BannerDAO.class.getName()).log(Level.SEVERE, null, e);
        }

    }

    public void deleteBanner(int id) {
        String query = "DELETE FROM dbo.Banner WHERE ID = ?";
        try {
            
            
           PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(BannerDAO.class.getName()).log(Level.SEVERE, null, e);
        } 
    }
}
