package dao.homeAdmin;

import database.DatabaseConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class DaoHome {

    private static DaoHome instance = null;

    public static DaoHome getInstance() {
        if (instance == null)
            instance = new DaoHome();
        return instance;
    }

    private DaoHome() {

    }

    Connection connect = DatabaseConnection.getConnection();

    public int getCountUser() {
        int result =0;
        try {
            String sql = "SELECT  COUNT(id) AS num FROM user";
            PreparedStatement s = connect.prepareStatement(sql);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                result = rs.getInt("num");
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return result;
    }

    public int getOrder() {
        int result=0;
        try {
            String sql = "SELECT  COUNT(id)  AS num FROM orders";
            PreparedStatement s = connect.prepareStatement(sql);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                result = rs.getInt("num");
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return result;
    }

//    get doanh thu
    public int getTurnover() {
        int result=0;
        try {
            String sql = "SELECT SUM(total_price) AS sumPrice FROM orders";
            PreparedStatement s = connect.prepareStatement(sql);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                result = rs.getInt("sumPrice");
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return result;
    }

    public int getQuantityProduct() {
        int result=0;
        try {
            String sql = "SELECT DISTINCT COUNT(id) AS num FROM product";
            PreparedStatement s = connect.prepareStatement(sql);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                result = rs.getInt("num");
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return result;
    }

    public int getQuantityProductDetail() {
        int result=0;
        try {
            String sql = "SELECT COUNT(id) AS num FROM product_detail WHERE id IN (SELECT id FROM product)";
            PreparedStatement s = connect.prepareStatement(sql);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                result = rs.getInt("num");
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return result;
    }

    public int getCountOrders() {
        int result =0;
        try {
            String sql = "SELECT COUNT(id) AS num FROM orders WHERE status=\"Hoàn tất\"";
            PreparedStatement s = connect.prepareStatement(sql);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                result = rs.getInt("num");
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return result;
    }

    public int getSumPrice() {
        int result =0;
        try {
            String sql = "SELECT SUM(price) sumPrice FROM product";
            PreparedStatement s = connect.prepareStatement(sql);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                result = rs.getInt("sumPrice");
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return result;
    }


    public int getCountProductSale() {
        int result =0;
        try {
            String sql = "SELECT COUNT(id) AS num FROM product WHERE saleRate>0";
            PreparedStatement s = connect.prepareStatement(sql);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                result = rs.getInt("num");
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return result;
    }

    public int getCountBrand() {
        int result =0;
        try {
            String sql = "SELECT COUNT(id) AS num FROM brand";
            PreparedStatement s = connect.prepareStatement(sql);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                result = rs.getInt("num");
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return result;
    }

    public int getCountComment() {
        int result =0;
        try {
            String sql = "SELECT COUNT(idComment) AS num FROM comment";
            PreparedStatement s = connect.prepareStatement(sql);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                result = rs.getInt("num");
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return result;
    }

    public int getCountCategory() {
        int result =0;
        try {
            String sql = "SELECT COUNT(id) AS num FROM category";
            PreparedStatement s = connect.prepareStatement(sql);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                result = rs.getInt("num");
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return result;
    }
}
