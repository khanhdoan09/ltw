package dao.product.category;
import database.DatabaseConnection;
import beans.Voucher;

import java.util.List;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DaoVoucher {
    private static DaoVoucher instance = null;

    public static DaoVoucher getInstance() {
        if (instance == null)
            instance = new DaoVoucher();
        return instance;
    }
    private DaoVoucher() {

    }

    Connection connect = DatabaseConnection.getConnection();


    public List<Voucher> getListVoucher() {
        List<Voucher> re = new ArrayList<Voucher>();
        try {
            String sql = "SELECT * FROM voucher";
            PreparedStatement s = connect.prepareStatement(sql);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                Voucher voucher = new Voucher(rs.getString("id"), rs.getString("from_date"), rs.getString("to_date"),rs.getInt("discount"));
                re.add(voucher);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return re;
    }

//    public ArrayList<Voucher> getListCategoryOnNav(String gender) {
//        ArrayList<Category> re = new ArrayList<Category>();
//        try {
//            String sql = "SELECT * FROM category WHERE gender=?";
//            PreparedStatement s = connect.prepareStatement(sql);
//            s.setString(1, gender);
//            ResultSet rs = s.executeQuery();
//            while (rs.next()) {
//                Category category = new Category(rs.getString("id"), rs.getString("name").toLowerCase(), rs.getString("gender"));
//                re.add(category);
//            }
//        } catch (SQLException e) {
//            System.out.println(e.getMessage());
//        }
//
//        return re;
//    }
//
    public boolean addVoucher(String from_date, String to_date,int discount) {
        PreparedStatement s = null;
        String sql = "INSERT INTO voucher(from_date, to_date,discount) VALUES (?, ?,?)";
        try {
            s = connect.prepareStatement(sql);
            s.setString(1, from_date);
            s.setString(2, to_date);
            s.setInt(3, discount);
            s.toString();
            s.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return false;
    }

    public boolean updateVoucher( String id, String from_date, String to_date,int discount) {
        PreparedStatement s = null;
        String sql = "UPDATE voucher SET from_date=?, to_date=?,discount=? WHERE id=?";
        try {
            s = connect.prepareStatement(sql);
            s.setString(1, from_date);
            s.setString(2, to_date);
            s.setInt(3, discount);
            s.setString(4, id);
            s.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("xx"+e.getMessage());
        }
        return false;
    }

    public boolean removeVoucher(String idVoucher) {
        PreparedStatement s = null;
        String sql = "DELETE FROM voucher WHERE id=?";
        try {
            s = connect.prepareStatement(sql);
            s.setString(1, idVoucher);
            s.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return false;
    }
}
