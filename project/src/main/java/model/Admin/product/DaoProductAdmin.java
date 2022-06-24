package model.Admin.product;
import beans.Product;
import connection.DatabaseConnection;

import java.sql.*;

public class DaoProductAdmin {
    private static DaoProductAdmin instance = null;
    Connection connect = DatabaseConnection.getConnection();

    public static DaoProductAdmin getInstance() {
        if (instance == null)
            instance = new DaoProductAdmin();
        return instance;
    }
    private DaoProductAdmin() {

    }

    public int addNewProduct(Product product) {
        PreparedStatement s = null;
        String sql = "Insert INTO product(price, saleRate, brand, name, create_at, description) VALUES(?, ?, ? ,?, ?, ?)";
        try {
            s = connect.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            s.setDouble(1, product.getPrice());
            s.setDouble(2, product.getSalePrice());
            s.setString(3, product.getBrand());
            s.setString(4, product.getName());
            s.setString(5, product.getCreate_at());
            s.setString(6, product.getDescription());
            // return id of auto increment
            s.executeUpdate();
            ResultSet rs = s.getGeneratedKeys();
            rs.next();
            return rs.getInt(1);
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }
}
