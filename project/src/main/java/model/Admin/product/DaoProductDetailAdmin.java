package model.Admin.product;

import beans.Product;
import connection.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public class DaoProductDetailAdmin {
    private static DaoProductDetailAdmin instance = null;
    Connection connect = DatabaseConnection.getConnection();

    public static DaoProductDetailAdmin getInstance() {
        if (instance == null)
            instance = new DaoProductDetailAdmin();
        return instance;
    }
    private DaoProductDetailAdmin() {

    }

    public int editProductDetail(Product product) {
        PreparedStatement s = null;
        String sql = "Insert INTO product_detail(id, size, totalValue, soleValue, createAt, color) VALUES(?, ?, ?, ?, ?, ?)";
        try {
            s = connect.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            System.out.println(s.toString());
            // return id of auto increment
            return s.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }
}
