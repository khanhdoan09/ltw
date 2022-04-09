package model.Admin;

import databaseConnection.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoUserAdmin {
    private static DaoUserAdmin instance = null;

    public static DaoUserAdmin getInstance() {
        if (instance == null)
            instance = new DaoUserAdmin();
        return instance;
    }
    private DaoUserAdmin() {

    }

    Connection connect = DatabaseConnection.getConnection();


    public List<User> getListUser() {
        List<User> re = new ArrayList<User>();
        // get list size
        try {
            String sql = "SELECT * FROM user";
            PreparedStatement s = connect.prepareStatement(sql);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                String id =  rs.getString("id");
                String email = rs.getString("email");
                String name = rs.getString("name");
                String phoneNumber = rs.getString("phone_number");
                String dob = rs.getString("dob");
                String gender = rs.getString("gender");
                String idAddress = rs.getString("idAddress");
                int isAdmin = rs.getInt("isAdmin");
                String create_at = rs.getString("create_at");
                String update_at = rs.getString("update_at");
                String idCart = rs.getString("idCart");
                String avatar = rs.getString("avatar");
                String password  = rs.getString("password");

                re.add(new User(id, email, name, phoneNumber, dob, gender, idAddress, isAdmin, create_at, update_at, idCart, avatar, password));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return re;
    }

}
