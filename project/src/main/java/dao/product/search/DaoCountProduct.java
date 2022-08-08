package dao.product.search;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import database.DatabaseConnection;


public class DaoCountProduct {
    private static DaoCountProduct instance = null;

    public static DaoCountProduct getInstance() {
        if (instance == null)
            instance = new DaoCountProduct();
        return instance;
    }
    Connection connect = DatabaseConnection.getConnection();

    private DaoCountProduct() {

    }

    public int getCountProduct(ArrayList<String> key, String sqlCount) {
        int re = 0;
        PreparedStatement s = null;
        try {
            s = connect.prepareStatement(sqlCount);
            for (int i = 0; i < key.size(); i++) {
                s.setString(i +1, key.get(i));
            }
            System.out.println(s.toString());
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                re = rs.getInt(1);
            }
            System.out.println(re);
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return re;
    }

}
