package dao.sign;

import beans.Banner;
import beans.User;
import database.DatabaseConnection;

import java.sql.*;

public class SignUpDao {
    private static SignUpDao instance = null;

    public static SignUpDao getInstance() {
        if (instance == null)
            instance = new SignUpDao();
        return instance;
    }

    private SignUpDao() {

    }

    Connection connect = DatabaseConnection.getConnection();

    // kiểm tra email có tồn tại không để đăng kí
    public boolean checkEmailExist(String email) {
        try {
            String idUser = null;
            String sql = "SELECT id FROM user WHERE email=?";
            PreparedStatement s = connect.prepareStatement(sql);
            s.setString(1, email);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                idUser = rs.getString("id");
            }
            System.out.println(idUser);
            if (idUser != null) {
                return false;
            }
            else {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return false;
    }

    public String createNewUser(User user) {
        String today = java.time.LocalDate.now().toString();
        try {
            String sql = "INSERT INTO user(name, email, phone_number, dob, gender, idAddress, isAdmin, create_at, update_at, idCart, avatar, password) VALUES( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement s = connect.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            s.setString(1, user.getName());
            s.setString(2, user.getEmail());
            s.setString(3, user.getPhone());
            s.setString(4, user.getDob());
            s.setString(5, user.getGender());
            s.setString(6, user.getIdAddress());
            s.setInt(7, 0);
            s.setString(8, today);
            s.setString(9, today);
            s.setString(10, user.getIdCart());
            s.setString(11, user.getAvatar());
            s.setString(12, user.getPassword());
            s.executeUpdate();

            // lấy id user được tự động tạo ra sau khi insert
            ResultSet rs = s.getGeneratedKeys();
            rs.next();
            int idUserNew = rs.getInt(1);
            return Integer.toString(idUserNew);
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

}
