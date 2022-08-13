package dao.user;

import database.DatabaseConnection;
import beans.User;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

// use for admin
public class DaoAuthentication {
    private static DaoAuthentication instance = null;

    public static DaoAuthentication getInstance() {
        if (instance == null)
            instance = new DaoAuthentication();
        return instance;
    }
    private DaoAuthentication() {

    }

    Connection connect = DatabaseConnection.getConnection();

    private String ecryptPassword(String password) {
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

    public void saveUser(User user) {
        String toDay = LocalDate.now().toString();
        try {
            String encryptPassword = ecryptPassword(user.getPassword());
            user.setPassword(encryptPassword);
            String sql = "INSERT INTO user(name, email, phone_number, dob, gender, idAddress, isAdmin, create_at, update_at, idCart, avatar, password) VALUES( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement s = connect.prepareStatement(sql);
            s.setString(1, user.getName());
            s.setString(2, user.getEmail());
            s.setString(3, user.getPhone());
            s.setString(4, user.getDob());
            s.setString(5, user.getGender());
            s.setString(6, user.getIdAddress());
            s.setInt(7, 2);
            s.setString(8, toDay);
            s.setString(9, toDay);
            s.setString(10, user.getIdCart());
            s.setString(11, user.getAvatar());
            s.setString(12, user.getPassword());

            s.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public boolean checkEmailExisted(String email) {
        String id=null;
        try {
            String sql = "SELECT id FROM user WHERE email=?";
            PreparedStatement s = connect.prepareStatement(sql);
            s.setString(1, email);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                id =  rs.getString("id");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return id==null;
    }

    public boolean checkPassword(String password) {
        String id=null;
        String encryptPassword = ecryptPassword(password);
        try {
            String sql = "SELECT id FROM user WHERE password=?";
            PreparedStatement s = connect.prepareStatement(sql);
            s.setString(1, encryptPassword);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                id =  rs.getString("id");
            }
            System.out.println(s.toString());
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return id==null;
    }

    public int getRole(String email, String password) {
        String encryptPassword = ecryptPassword(password);
        try {
            String sql = "SELECT isAdmin FROM user WHERE email=? AND password=?";
            PreparedStatement s = connect.prepareStatement(sql);
            s.setString(1, email);
            s.setString(2, encryptPassword);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                return rs.getInt("isAdmin");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return 3;
    }


    public String getIdAdmin(String email, String password) {
        String result = "";
        String encryptPassword = ecryptPassword(password);
        try {
            String sql = "SELECT id FROM user WHERE email=? and password=?";
            PreparedStatement s = connect.prepareStatement(sql);
            s.setString(1, email);
            s.setString(2, encryptPassword);

            System.out.println(s.toString());
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                result =  rs.getString("id");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return result;
    }


}
