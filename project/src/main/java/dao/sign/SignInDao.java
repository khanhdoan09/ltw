package dao.sign;

import beans.Banner;
import database.DatabaseConnection;
import beans.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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

    public boolean checkEmail(String email) {
        try {
            String idUser = null;
            String sql = "SELECT id FROM user WHERE email=?";
            PreparedStatement s = connect.prepareStatement(sql);
            s.setString(1, email);
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
        String idUser = null;
        try {
            String sql = "SELECT id FROM user WHERE email=? AND password=?";
            PreparedStatement s = connect.prepareStatement(sql);
            s.setString(1, user.getEmail());
            s.setString(2, user.getPassword());
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

}