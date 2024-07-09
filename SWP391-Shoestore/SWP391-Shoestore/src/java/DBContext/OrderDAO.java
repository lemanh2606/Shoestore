package DBContext;

import entity.Order;
import entity.Product;
import entity.Users;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


public class OrderDAO extends DBcontext{

  

    public List<Order> getOrderByUserID(int userId) {
        List<Order> list = new ArrayList<>();
        String query = "SELECT o.ID, os.Name, o.TotalPrice, o.Date\n"
                + "FROM Orders o  INNER JOIN Order_Status os\n"
                + "ON o.Status = os.ID\n"
                + "WHERE o.UserId = ?";
        try {
           
          PreparedStatement  ps = connection.prepareStatement(query);
            ps.setInt(1, userId);
         ResultSet   rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getDate(4)));
            }
        } catch (Exception e) {
        }
       
        return list;
    }

    public ArrayList<Order> getOdByListProduct(ArrayList<Product> listP) {
        String query = "select o.ID , o.UserID , o.TotalPrice , o.Note , o.Status , o.Date , d.Order_ID , d.ProductID , d.ProductName , d.ProductPrice ,d.ProductPrice , d.Quantity from Orders o\n"
                + "join Order_Detail d on d.Order_ID = o.ID\n"
                + "where ProductID =  ? ";
        ArrayList<Order> order = new ArrayList<>();
        try {
         
          PreparedStatement  ps = connection.prepareStatement(query);
            for (Product p : listP) {
                ps = connection.prepareStatement(query);
                ps.setInt(1, p.getProductID());
             ResultSet   rs = ps.executeQuery();
                while (rs.next()) {
                    order.add(new Order(
                            rs.getInt(1),
                            rs.getInt(2),
                            rs.getInt(3),
                            rs.getString(4),
                            rs.getString(5),
                            rs.getDate(6),
                            rs.getInt(7),
                            rs.getInt(8),
                            rs.getString(9),
                            rs.getInt(10),
                            rs.getInt(11)
                    ));
                }
            }
        } catch (Exception e) {
        }
        return order;
    }

    public ArrayList<Order> getAllOrders() {
        String query = "select o.ID , o.UserID , o.TotalPrice , o.Note , o.Status , o.Date , d.Order_ID , d.ProductID , d.ProductName  ,d.ProductPrice , d.Quantity from Orders o\n"
                + "join Order_Detail d on d.Order_ID = o.ID\n";
        ArrayList<Order> list = new ArrayList<>();
        try {
           
          PreparedStatement  ps = connection.prepareStatement(query);
        ResultSet    rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Order(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getDate(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public int getTotalOrders() {
        String query = "select count (*)from Orders";
        int total = 0;
        try {
           
          PreparedStatement  ps = connection.prepareStatement(query);

        ResultSet    rs = ps.executeQuery();
            while (rs.next()) {
                return total = rs.getInt(1);
            }
        } catch (Exception e) {
        }
       
        return 0;
    }

    public int addOrder(Order order) {
        try {
         
         PreparedStatement   ps = connection.prepareStatement("INSERT INTO dbo.Orders (UserID,TotalPrice,Note,Status,Date) VALUES(?,?,?,1,GETDATE())", PreparedStatement.RETURN_GENERATED_KEYS);
            ps.setInt(1, order.getUserId());
            ps.setDouble(2, order.getTotalPrice());
            ps.setNString(3, order.getNote());
            ps.executeUpdate();
          ResultSet  rs = ps.getGeneratedKeys();
            if (rs.next()) {
                return (int) rs.getLong(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        } 
        return 0;
    }

    public boolean CheckOrderExist(int orderID, ArrayList<Order> olist) {
        boolean flag = false;
        for (Order o : olist) {
            if (orderID == o.getId()) {
                flag = true;
            }
        }
        return flag;
    }

    public void OrderAction(int orderID, String action) {
        String query = "";
        switch (action) {
            case "accept":
                query = "update Orders set Status = 2 \n"
                        + "where ID = ? ";
                break;
            case "reject":
                query = "update Orders set Status = 4 \n"
                        + "where ID =  ? ";
                break;
        }

        try {
            
        PreparedStatement    ps = connection.prepareStatement(query);
            ps.setInt(1, orderID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Order> getOrderByOdID(int orderID) {
        String query = "select o.ID , o.UserID , o.TotalPrice , o.Note , o.Status , o.Date , d.Order_ID , d.ProductID , d.ProductName  ,d.ProductPrice , d.Quantity from Orders o\n"
                + "join Order_Detail d on d.Order_ID = o.ID\n"
                + "where o.ID = ?  "; // 
        List<Order> list = new ArrayList<>();
        try {
            
        PreparedStatement    ps = connection.prepareStatement(query);
            ps.setInt(1, orderID);
         ResultSet   rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Order(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getDate(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Order getAnOrderByUserID(int id) {
        String query = "SELECT o.ID, os.Name, o.TotalPrice, o.Date\n"
                + "FROM Orders o  INNER JOIN Order_Status os\n"
                + "ON o.Status = os.ID\n"
                + "WHERE o.UserId = ?";
        try {
          
        PreparedStatement    ps = connection.prepareStatement(query);
            ps.setInt(1, id);
         ResultSet   rs = ps.executeQuery();
            while (rs.next()) {
                return (new Order(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getDate(4)));
            }
        } catch (Exception e) {
        }
       
        return null;

    }

    public int geTotalUserIDByListP(ArrayList<Product> listP) {
        int total = 0;
        String query = "select UserID from Orders o\n"
                + "                join Order_Detail d on d.Order_ID = o.ID\n";

        int count = 0;
        try {
          

            for (int i = 0; i < listP.size(); i++) {
                if (i == 0) {
                    query += "where ProductID = " + listP.get(i).getProductID();
                } else {
                    query += " or ProductID = " + listP.get(i).getProductID();
                }
            }
            query += "group by UserID";
      PreparedStatement      ps = connection.prepareStatement(query);
         ResultSet   rs = ps.executeQuery();
            while (rs.next()) {
                total++;
            }
        } catch (Exception e) {
        }

        return total;
    }

    public int geTotalOrderByListP(ArrayList<Product> listP) {
        int total = 0;
        String query = "select o.ID from Orders o\n"
                + "                join Order_Detail d on d.Order_ID = o.ID\n";

        int count = 0;
        try {
           

            for (int i = 0; i < listP.size(); i++) {
                if (i == 0) {
                    query += "where ProductID = " + listP.get(i).getProductID();
                } else {
                    query += " or ProductID = " + listP.get(i).getProductID();
                }
            }
            query += "group by o.ID";
           PreparedStatement ps = connection.prepareStatement(query);
          ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                total++;
            }
        } catch (Exception e) {
        }   

        return total;
    }

    public int getProfitByOrder(ArrayList<Order> olist) {

        int profit = 0;
        for (Order o : olist) {
            profit += (o.getTotalPrice() - (o.getQuantity() * o.getProductPrice()) );
        }
        return profit;
    }

    public ArrayList<Order> getOrderPackaging() {
        String query = "select * from Orders where Status = 2 ";
        ArrayList<Order> list = new ArrayList<>();
        try {
           
           PreparedStatement ps = connection.prepareStatement(query);
           ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Order(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getDate(6))
                );
            }
        } catch (Exception e) {
        }
        return list;

    }

    public Order getOrderByOrderID(int orderID) {
        String query = "select o.ID , o.UserID , o.TotalPrice , o.Note , o.Status , o.Date , d.Order_ID , d.ProductID , d.ProductName  ,d.ProductPrice , d.Quantity from Orders o\n"
                + "join Order_Detail d on d.Order_ID = o.ID\n"
                + "where o.ID = ?  "; // 
        try {
           
          PreparedStatement  ps = connection.prepareStatement(query);
            ps.setInt(1, orderID);
           ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Order(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getDate(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11));

            }
        } catch (Exception e) {
        }
        return null;
    }
     public void updateOrderStatus(int orderID, String status) {
        String query = "UPDATE Orders SET Status = ? WHERE ID = ?";
        try (
            PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, status);
            ps.setInt(2, orderID);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
