/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBContext;

import entity.Delivery;
import entity.Order;
import entity.Ship;
import entity.ShipInfo;
import entity.Users;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ShipDAO extends DBcontext {

    public ArrayList<Ship> getShip() {
        ArrayList<Ship> list = new ArrayList<>();
        try {
            String query = "SELECT * from dbo.Ship";

            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Ship(rs.getInt("id"), rs.getString("CityName"), rs.getInt("ShipPrice")));
            }
        } catch (SQLException e) {
            Logger.getLogger(ShipDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public Ship getShip(int id) {
        Ship ship = null;
        try {
            String query = "SELECT * from dbo.Ship where id=?";

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ship = new Ship(rs.getInt("id"), rs.getString("CityName"), rs.getInt("ShipPrice"));
            }
        } catch (SQLException e) {
            Logger.getLogger(ShipDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return ship;
    }

    public ShipInfo getShipInfoByOdID(int orderID) {
        String query = " select * from ShipInfo where Order_ID = ? ";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, orderID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new ShipInfo(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getString(6), rs.getString(7));
            }
        } catch (Exception e) {

        }
        return null;
    }

    public ArrayList<ShipInfo> getShipInfoByOrder(ArrayList<Order> listOrder) {
        String query = "";
        ArrayList<ShipInfo> list = new ArrayList<>();
        try {
            for (int i = 0; i < listOrder.size(); i++) {
                if (i == 0) {
                    query += "select * from ShipInfo where Order_ID = " + listOrder.get(i).getId();
                } else {
                    query += " or Order_ID = " + listOrder.get(i).getId();
                }
            }
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ShipInfo(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getString(6), rs.getString(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void addJob(int jid, int userID) {
        String query = "insert into Delivery values ( ? , ? , 2 )";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, jid);
            ps.setInt(2, userID);
            ps.executeQuery();
        } catch (Exception e) {
        }
    }

    public ArrayList<Delivery> getDeliveryJobByShipper(int userID) {
        ArrayList<Delivery> list = new ArrayList<>();
        String query = "select * from Delivery \n"
                + "where UserID =  ? ";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, userID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Delivery(
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public boolean CheckJobExist(int jid, ArrayList<Delivery> list) {
        boolean flag = false;
        for (Delivery delivery : list) {
            if (jid == delivery.getShipInfo()) {
                flag = true;
            }
        }
        return flag;
    }

    public void confirmJob(int jid, String action) {
        String query = "";
        switch (action) {
            case "Accomplished":
                query = "update Delivery set Status = 1 where ID = ? ";
                break;
            case "Take":
                query = "update Delivery set Status = 3 where ID =  ? ";
                break;
        }
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, jid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public ArrayList<Delivery> getJobByShipper(int userID) {
        String query = "select * From Delivery \n"
                + "                where UserID = ? ";
        ArrayList<Delivery> list = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, userID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Delivery(
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public ArrayList<ShipInfo> getShipInfoByJob(ArrayList<Delivery> listJob) {
        String query = "";
        ArrayList<ShipInfo> list = new ArrayList<>();
        for (int i = 0; i < listJob.size(); i++) {
            if (i == 0) {
                query = "select * from ShipInfo \n"
                        + "where  ID = " + listJob.get(i).getShipInfo();
            } else {
                query += " or  ID = " + listJob.get(i).getShipInfo();;
            }
        }
        try {

            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ShipInfo(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getString(6), rs.getString(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }
}
