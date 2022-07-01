package dao.product.brand;

import beans.Brand;
import connection.DatabaseConnection;

import java.sql.*;
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

    public String getNameBrand(String idBrand) {
        PreparedStatement s = null;
        String sql = "SELECT name FROM brand where id=?";
        try {
            s = connect.prepareStatement(sql);
            s.setString(1, idBrand);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                return rs.getString("name");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return "";
    }

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

    public ArrayList<Brand> getBrands() {
        ArrayList<Brand> re = new ArrayList<Brand>();
        PreparedStatement s = null;
        String sql = "SELECT * FROM brand";
        try {
            s = connect.prepareStatement(sql);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                Brand brand = new Brand(rs.getString("id"), rs.getString("name"), rs.getString("img"));
                re.add(brand);
            }
            return re;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return re;
    }

    public boolean deleteBrand(String idBrand) {
        PreparedStatement s = null;
        String sql = "DELETE FROM `brand` WHERE id=?";
        try {
            s = connect.prepareStatement(sql);
            s.setString(1, idBrand);
            s.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return false;
    }

    public boolean updateNewNameBrand(String id, String newName) {
        PreparedStatement s = null;
        String sql = "UPDATE brand SET name=? WHERE id=?";
        try {
            s = connect.prepareStatement(sql);
            s.setString(1, newName);
            s.setString(2, id);
            System.out.println(s.toString());
            s.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("xx"+e.getMessage());
        }
        return false;
    }

    public boolean updateUrlBrand(String id, String url) {
        PreparedStatement s = null;
        String sql = "UPDATE brand SET img=? WHERE id=?";
        try {
            s = connect.prepareStatement(sql);
            s.setString(1, id+"_"+url);
            s.setString(2, id);
            System.out.println(s.toString());
            s.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("xx"+e.getMessage());
        }
        return false;
    }
    public int saveANewBrand(String name, String img) {
        PreparedStatement s = null;
        String sql = "INSERT INTO brand(name, img) VALUES (?, ?)";
        try {
            s = connect.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            s.setString(1, name);
            s.setString(2, img);
            s.executeUpdate();
            ResultSet rs = s.getGeneratedKeys();
            rs.next();
            return rs.getInt(1);
        } catch (SQLException e) {
            System.out.println(e.getMessage() +"b");
        }
        return 0;
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
