package dao.user;

import connection.DatabaseConnection;
import dao.sign.SignInDao;
import beans.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {
    private static UserDao instance = null;

    public static UserDao getInstance() {
        if (instance == null)
            instance = new UserDao();
        return instance;
    }

    private UserDao() {

    }

    Connection connect = DatabaseConnection.getConnection();

    public String getUser(String userId) {
        try {
            String sql = "SELECT name FROM user WHERE id=?";
            PreparedStatement s = connect.prepareStatement(sql);
            s.setString(1, userId);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                return rs.getString("name");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
}
