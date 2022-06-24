package dao.product.brand;

import connection.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoProductBrand {
    private static DaoProductBrand instance = null;

    public static DaoProductBrand getInstance() {
        if (instance == null)
            instance = new DaoProductBrand();
        return instance;
    }
    private DaoProductBrand() {

    }
    Connection connect = DatabaseConnection.getConnection();

    public List<String> getListBrand() {
        List<String> re = new ArrayList<String>();
        PreparedStatement s = null;
        String sql = "SELECT id FROM brand";
        try {
            s = connect.prepareStatement(sql);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                re.add(rs.getString("id"));
            }
            return re;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return re;
    }

    public boolean saveNewBrand(String brand) {
        PreparedStatement s = null;
        String sql = "INSERT INTO brand VALUES (?)";
        try {
            s = connect.prepareStatement(sql);
            s.setString(1, brand);
            s.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage() +"b");
        }
        return false;
    }
}
