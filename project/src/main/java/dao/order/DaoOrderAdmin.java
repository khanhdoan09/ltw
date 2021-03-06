package dao.order;

import database.DatabaseConnection;
import beans.OrderInAdmin;
import beans.OrderDetailInAdmin;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoOrderAdmin {

    private static DaoOrderAdmin instance = null;

    public static DaoOrderAdmin getInstance() {
        if (instance == null)
            instance = new DaoOrderAdmin();
        return instance;
    }
    private DaoOrderAdmin() {

    }

    Connection connect = DatabaseConnection.getConnection();


    public List<OrderInAdmin> getListOrder(String sql) {
        List<OrderInAdmin> re = new ArrayList<OrderInAdmin>();
        // get list size
        try {
            PreparedStatement s = connect.prepareStatement(sql);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                String id =  rs.getString("id");
                String customer = rs.getString("customer");
                double total = rs.getDouble("total_price");
                String createAt = rs.getString("create_at");
                String status = rs.getString("status");


                re.add(new OrderInAdmin(id, customer, total, createAt, status));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return re;
    }

    public List<OrderDetailInAdmin> getListOrderDetail(String idOrder) {
        List<OrderDetailInAdmin> re = new ArrayList<OrderDetailInAdmin>();
        // get list size
        try {
            String sql = "SELECT idOrder, idShoe, size, color, quantity FROM order_detail WHERE idOrder=?";
            PreparedStatement s = connect.prepareStatement(sql);
            s.setString(1, idOrder);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                String id =  rs.getString("idOrder");
                String idShoe =  rs.getString("idShoe");
                int size = rs.getInt("size");
                String color = rs.getString("color");
                int quantity = rs.getInt("quantity");
                re.add(new OrderDetailInAdmin(id, idShoe, size, color, quantity));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return re;
    }
}
