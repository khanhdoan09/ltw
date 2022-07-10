package dao.product.color;
import database.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoProductColor {
    private static DaoProductColor instance = null;

    public static DaoProductColor getInstance() {
        if (instance == null)
            instance = new DaoProductColor();
        return instance;
    }
    private DaoProductColor() {

    }
    Connection connect = DatabaseConnection.getConnection();


    public List<String> getListColor(String id) {
        List<String>list = new ArrayList<String>();
        try {
            String sql = "SELECT color FROM linkimg WHERE idProduct=? GROUP BY color";
            PreparedStatement s = connect.prepareStatement(sql);
            s.setString(1, id);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                String color = rs.getString("color");
                list.add(color);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return list;
    }

    public boolean removeColor(String id, String color) {
        PreparedStatement s = null;
        String sql = "DELETE FROM linkimg WHERE idProduct=? && color=?";

        PreparedStatement s2 = null;
        String sql2 = "DELETE FROM product_detail WHERE id=? && color=?";
        try {
            s = connect.prepareStatement(sql);
            s.setString(1, id);
            s.setString(2, color);
            s.executeUpdate();
            // sau nay set relationship roi thi khoi can lam cai nay
            s2 = connect.prepareStatement(sql2);
            s2.setString(1, id);
            s2.setString(2, color);
            s2.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }
        return true;
    }


    public boolean editColor(String id, String colorNew, String colorOld) {
        PreparedStatement s = null;
        String sql = "UPDATE product_detail SET color=? WHERE id=? && color=?";
        PreparedStatement s2 = null;
        String sql2 = "UPDATE linkimg SET color=? WHERE idProduct=? && color=?";
        try {
            s = connect.prepareStatement(sql);
            s.setString(1, colorNew);
            s.setString(2, id);
            s.setString(3, colorOld);
            System.out.println(s.toString());
            s.executeUpdate();

            // sau nay set key lien ket roi nho xoa cai nay
            s2 = connect.prepareStatement(sql2);
            s2.setString(1, colorNew);
            s2.setString(2, id);
            s2.setString(3, colorOld);
            System.out.println(s2.toString());
            s2.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            System.out.println(s.toString());
            return false;
        }
    }

    public boolean saveMainColor(String id, String color) {
        PreparedStatement s = null;
        String sql = "UPDATE product SET mainColor=? WHERE id=?";
        try {
            s = connect.prepareStatement(sql);
            s.setString(1, color);
            s.setString(2, id);
            s.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return false;
    }
}
