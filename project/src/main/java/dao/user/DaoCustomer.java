package dao.user;

import beans.History;
import database.DatabaseConnection;
import beans.User;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoCustomer {
    private static DaoCustomer instance = null;
    Connection connect = DatabaseConnection.getConnection();


    public static DaoCustomer getInstance() {
        if (instance == null)
            instance = new DaoCustomer();
        return instance;
    }

    private DaoCustomer() {
    }

    public boolean updateInfo(String id, String name, String email, String phone, String gender) {
        try {
            String sql = "UPDATE user SET name = ?, email = ?, phone_number = ?, gender=? WHERE id = ?;";
            PreparedStatement s = connect.prepareStatement(sql);
            s.setString(1, name);
            s.setString(2, email);
            s.setString(3, phone);
            s.setString(4, gender);
            s.setString(5, id);

            int row = s.executeUpdate();
            return row == 1? true: false;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return false;
    }
    private String encryptPassword(String password) {
        String encryptPassword = null;
        try {
            MessageDigest m = MessageDigest.getInstance("MD5");
            m.update(password.getBytes());
            byte[] bytes = m.digest();
            StringBuilder s = new StringBuilder();
            for(int i=0; i< bytes.length ;i++)
            {
                s.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
            }

            /* Complete hashed password in hexadecimal format */
            encryptPassword = s.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return encryptPassword;
    }

    public boolean checkOldPasswordToChange(String id, String oldPassword) {
        String encryptPassword = encryptPassword(oldPassword);
        try {
            String sql = "SELECT * FROM user WHERE id=? AND password=?";
            PreparedStatement s = connect.prepareStatement(sql);
            s.setString(1, id);
            s.setString(2, oldPassword);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }
        return false;
    }
    public boolean changePassword(String customerId, String newPassword) {
        String encryptPassword = encryptPassword(newPassword);
        try {
            String sql = "UPDATE user SET password=? WHERE id = ?;";
            PreparedStatement s = connect.prepareStatement(sql);
            s.setString(1, encryptPassword);
            s.setString(2, customerId);
            int row = s.executeUpdate();
            return row == 1? true: false;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return false;
    }
    public User getUser(String id) {
        User user = null;
        try {
            String sql = "SELECT * FROM user WHERE id=?";
            PreparedStatement s = connect.prepareStatement(sql);
            s.setString(1, id);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                String email = rs.getString("email");
                String phone = rs.getString("phone_number");
                String dob = rs.getString("dob");
                String gender = rs.getString("gender");
                String idCart = rs.getString("idCart");
                String avatar = rs.getString("avatar");
                user = new User(name, email, phone, dob, gender, idCart, avatar);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return user;
    }

    public List<History> getHistoryPurchase(String customerId) {
        List<History> re = new ArrayList<History>();

        try {
            String sql = "SELECT orders.id, idShoe, product.name, orders.status, order_detail.quantity, order_detail.size, order_detail.color, product.price, orders.create_at FROM user inner join orders on user.id=orders.customer inner join order_detail on orders.id = order_detail.idOrder inner join product on product.id=order_detail.idShoe where user.id=?";
            PreparedStatement s = connect.prepareStatement(sql);
            s.setString(1, customerId);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                String orderId = rs.getString("id");
                String productName = rs.getString("name");
                String orderStatus = rs.getString("status");
                String productColor = rs.getString("color");
                String createAt = rs.getString("create_at");
                String shoeId = rs.getString("idShoe");
                String avatar = getAvatarShoe(shoeId, productColor);
                int productQuantity = rs.getInt("quantity");
                int productSize = rs.getInt("size");
                int productPrice = rs.getInt("price");
                History history = new History(orderId, productName, orderStatus, productColor, avatar, createAt, productQuantity, productSize, productPrice);
                re.add(history);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return re;
    }

    private String getAvatarShoe(String shoeId, String colorId) {
        String re="";
        try {
            String sql = "SELECT img FROM `linkimg` inner join product on linkimg.id=product.id where product.id=? and color=? and level=0;";
            PreparedStatement s = connect.prepareStatement(sql);
            s.setString(1, shoeId);
            s.setString(2, colorId);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
              re = rs.getString("img");
              return re;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return re;
    }
}