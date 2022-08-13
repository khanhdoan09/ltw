package dao.product.category;
import database.DatabaseConnection;
import beans.Voucher;

import java.util.List;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.UUID;

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
                Voucher voucher = new Voucher(rs.getString("id"), rs.getString("from_date"), rs.getString("to_date"),rs.getInt("discount"), rs.getString("code"), rs.getInt("used"));
                re.add(voucher);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return re;
    }

    public boolean addVoucher(String from_date, String to_date,int discount) {
        PreparedStatement s = null;
        String sql = "INSERT INTO voucher(from_date, to_date,discount, code, used) VALUES (?, ?, ?, ?, 0)";
        try {
            s = connect.prepareStatement(sql);
            s.setString(1, from_date);
            s.setString(2, to_date);
            s.setInt(3, discount);
            s.setString(4, createRandomCodeVoucher());
            s.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return false;
    }

    public String createRandomCodeVoucher() {
        String re = "";
        while (true) {
            try {
                String randomCodeVoucher = UUID.randomUUID().toString().substring(0, 5);
                String sql = "SELECT * FROM voucher";
                PreparedStatement s = connect.prepareStatement(sql);
                ResultSet rs = s.executeQuery();
                while (rs.next()) {
                   if (!rs.getString("code").equals(randomCodeVoucher)) {
                       return randomCodeVoucher;
                   }
                }
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
            return null;
        }
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
