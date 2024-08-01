/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBContext;

import entity.ShipInfo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ShipInfoDAO extends DBcontext {

    public int addShipInfo(ShipInfo shipinfo) {
        try {
            PreparedStatement ps = connection.prepareStatement("INSERT INTO dbo.ShipInfo (Order_ID,CustomerName,ShippingAddress,ShipCityID,PhoneNum,Note) VALUES(?,?,?,?,?,?)");
            ps.setInt(1, shipinfo.getOrderID());
            ps.setNString(2, shipinfo.getCustomerName());
            ps.setNString(3, shipinfo.getShippingAddress());
            ps.setInt(4, shipinfo.getShipCityID());
            ps.setString(5, shipinfo.getPhoneNum());
            ps.setNString(6, shipinfo.getNote());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ShipInfoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
}
