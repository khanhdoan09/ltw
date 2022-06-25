package dao.sign;

import beans.Banner;
import connection.DatabaseConnection;
import dao.order.DaoOrderAdmin;
import beans.User;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SignInDao {

    private static SignInDao instance = null;

    public static SignInDao getInstance() {
        if (instance == null)
            instance = new SignInDao();
        return instance;
    }

    private SignInDao() {

    }

    Connection connect = DatabaseConnection.getConnection();

    public boolean checkEmail(User user) {
        try {
            String idUser = null;
            String sql = "SELECT id FROM user WHERE email=?";
            PreparedStatement s = connect.prepareStatement(sql);
            s.setString(1, user.getEmail());
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                idUser = rs.getString("id");
            }
            if (idUser != null) {
                return true;
            }
            else {
                return false;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return false;
    }

    public String checkPassword(User user) {
        String encryptPassword = encryptPassword(user.getPassword());
        String idUser = null;
        try {
            String sql = "SELECT id FROM user WHERE email=? AND password=?";
            PreparedStatement s = connect.prepareStatement(sql);
            s.setString(1, user.getEmail());
            s.setString(2, encryptPassword);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                idUser = rs.getString("id");
            }
            if (idUser != null) {
                return idUser;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
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
            encryptPassword = s.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return encryptPassword;
    }


}