package DBContext;

import entity.Users;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.Factory;

/**
 *
 * @author LAMDTHE153097
 */
public class UserDAO extends DBcontext {

    public List<Users> getAllUsers() {
        List<Users> list = new ArrayList<>();
        String query = "select * from Users";
        try {

            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Users(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getInt(6)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public Users getUsersByID(int id) {
        String query = "select * from Users where UserID = ? ";
        try {

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Users(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getString(4),
                        rs.getInt(5), rs.getInt(6));
            }
        } catch (Exception e) {
        }

        return null;
    }

    public Users getUsersByEmail(String userEmail) {
        String query = "select * from Users where email = '?'";
        try {

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, userEmail);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Users(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getString(4),
                        rs.getInt(5), rs.getInt(6));
            }
        } catch (Exception e) {
        }

        return null;
    }

    public Users getUserByUsername(String userName) {
        String query = "select * from Users where Username = '?'";
        try {

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, userName);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Users(
                        rs.getInt("UserID"),
                        rs.getString("UserName"),
                        rs.getString("Password"),
                        rs.getString("email"),
                        rs.getInt("RoleID"),
                        rs.getInt("StatusID")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public boolean updatePassword(int id, String newPassword) {
        Users toChange = getUsersByID(id);
        String query = "UPDATE Users\n"
                + "SET Password = ?\n"
                + "WHERE UserID = ?";
        try {

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, newPassword);
            ps.setInt(2, id);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public int checkExitsEmail(String mail) {
        String query = "select * from Users where email = ?";
        try {

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, mail);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return 1;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return -1;
    }

    public static int randomNumber(int min, int max) {
        Random rnd = new Random();
        return rnd.nextInt((max - min) + 1) + min;
    }

    public String RandomPassword(int numberOfCharactor) {
        String alpha = "abcdefghijklmnopqrstuvwxyz"; // a-z
        String alphaUpperCase = alpha.toUpperCase(); // A-Z
        String digits = "0123456789"; // 0-9
        String ALPHA_NUMERIC = alpha + alphaUpperCase + digits;
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < numberOfCharactor; i++) {
            int number = randomNumber(0, ALPHA_NUMERIC.length() - 1);
            char ch = ALPHA_NUMERIC.charAt(number);
            sb.append(ch);
        }
        return sb.toString();
    }

    public void updatePasswordByEmail(String pass, String email) {
        String query = "UPDATE Users SET  Password = ? WHERE email = ?";
        try {

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, pass);
            ps.setString(2, email);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void addAccount(String username, String password, String email, int roleID, int statusID) {
        String query = "INSERT INTO [dbo].[Users] ([Username], [Password], [email], [RoleID], [StatusID]) VALUES (?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, email);
            ps.setInt(4, roleID);
            ps.setInt(5, statusID);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void editAccount(int id, String user, String pass, String email, int role) {
        String query = "UPDATE Users\n"
                + "SET Username = ?,\n"
                + "Password = ?,\n"
                + "email = ?,"
                + "RoleID = ?\n"
                + "WHERE UserID = ?";
        try {

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.setString(3, email);
            ps.setInt(4, role);
            ps.setInt(5, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }

    }

    public void deleteAccount(String id) {
        String query = "alter table UserAddress nocheck constraint all\n"
                + "alter table Notifications nocheck constraint all\n"
                + "alter table Orders nocheck constraint all\n"
                + "alter table Feedback nocheck constraint all\n"
                + "alter table Feedback_Replies nocheck constraint all\n"
                + "alter table Product nocheck constraint all\n"
                + "alter table Cart nocheck constraint all\n"
                + "\n"
                + "delete from Users where UserID= ? \n"
                + "\n"
                + "alter table UserAddress check constraint all\n"
                + "alter table Notifications check constraint all\n"
                + "alter table Orders check constraint all\n"
                + "alter table Feedback check constraint all\n"
                + "alter table Feedback_Replies check constraint all\n"
                + "alter table Product check constraint all\n"
                + "alter table Cart check constraint all";
        try {

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }

    }

    public String getRoleByUserName(String userName) {
        String query = "select r.RoleName from Users  u  \n"
                + "JOIN Role   r\n"
                + "on u.RoleID = r.RoleID\n"
                + "where u.Username =  ? ";
        String role = "";

        try {

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, userName);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return role = rs.getString(1);
            }
        } catch (Exception e) {
        }
        return null;
    }

    public int getUserIDByName(String username) {
        String query = "select UserID  FROM Users\n"
                + "where Username = ? ";
        int id = 0;
        try {

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return id = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return id;
    }

    public int getTotalUser() {
        String query = "select count (*)from Users";
        int total = 0;
        try {

            PreparedStatement ps = connection.prepareStatement(query);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return total = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public ArrayList<Users> getStudentByName(String txtSearch) {
        ArrayList<Users> list = new ArrayList<>();
        String query = "SELECT * FROM Users where UserName like '" + txtSearch + "%'";
        try {

            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Users(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getInt(5), rs.getInt(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public int countCustomer() {
        try {
            String query = "SELECT COUNT(UserID) AS Count,RoleID FROM dbo.Users WHERE RoleID=3 GROUP BY RoleID ";

            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt("Count");
            }
        } catch (SQLException e) {
            java.util.logging.Logger.getLogger(UserDAO.class.getName()).log(java.util.logging.Level.SEVERE, null, e);
        }
        return 0;
    }

    //========================================================================
    public boolean checkExistEmail(String email) {
        List<Users> listUsers = getAllUsers();
        for (Users user : listUsers) {
            if (user.getEmail() != null) {
                if (user.getEmail().equals(email)) {
                    return true;
                }
            }
        }
        return false;
    }

    public String encodePassword(String password) {
        MessageDigest md;
        String result = "";
        try {
            md = MessageDigest.getInstance("MD5");
            md.update(password.getBytes());
            BigInteger bi = new BigInteger(1, md.digest());

            result = bi.toString(16);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return result;
    }

    public boolean isTruePassword(String enteredPassword, String stored) {
        String enteredHash = encodePassword(enteredPassword);
        return enteredHash.equals(stored);
    }

    public Users getUserByToken(String token) {
        Users user = new Users();
        Transaction transaction = null;
        try {
            Session session = Factory.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            String hql = "select u from User u join Token t on u.id = CAST(t.userID as biginteger) where t.token = :token";
            user = (Users) session.createQuery(hql)
                    .setParameter("token", token)
                    .uniqueResult();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return user;
    }

    public void updateUser(Users userUpdate) {
        Transaction transaction = null;
        try (Session session = Factory.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();

            session.update(userUpdate);
            transaction.commit();
        } catch (Exception ex) {
            if (transaction == null) {
                transaction.rollback();
            }
            ex.printStackTrace();
        }
    }

    public Users getUserByEmail(String email) {
        String sql = "Select * from [Users] where email = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Users(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Users getUserById(int userId) {
        String sql = "Select * from [User] where id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Users(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void updatePassword(String email, String password) {
        String sql = "UPDATE [dbo].[users]\n"
                + "   SET [password] = ?\n"
                + " WHERE [email] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, password);
            st.setString(2, email);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void insertUser(Users User) {
        Transaction transaction = null;
        try (Session session = Factory.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();

            session.saveOrUpdate(User);

            transaction.commit();
        } catch (Exception ex) {
            if (transaction == null) {
                transaction.rollback();
            }
            ex.printStackTrace();
        }
    }
}
