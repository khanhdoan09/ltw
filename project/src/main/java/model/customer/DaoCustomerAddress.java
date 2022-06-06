package model.customer;

import databaseConnection.DatabaseConnection;
import model.User;
import bean.AddressCustomer;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoCustomerAddress {
    private static DaoCustomerAddress instance = null;
    Connection connect = DatabaseConnection.getConnection();


    public static DaoCustomerAddress getInstance() {
        if (instance == null)
            instance = new DaoCustomerAddress();
        return instance;
    }

    private DaoCustomerAddress() {
    }

    public boolean updateInfo(String id, String name, String email, String phone, String gender) {
        try {
            String sql = "UPDATE user SET name = ?, email = ?, phone_number = ?, gender=? WHERE id = ?;";
            PreparedStatement s = connect.prepareStatement(sql);
            s.setString(1, name);
            s.setString(2, email);
            s.setString(3, phone);
            s.setString(4, gender);
            s.setString(5, id);

            int row = s.executeUpdate();
            return row == 1? true: false;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return false;
    }

    public boolean addAddress(String customerId, String cityId, String districtId, String wardId, String description) {
        try {

            String sql = "REPLACE INTO address(idCity, idDistrict, idWard, description, idCustomer) VALUES(?, ?, ?, ?, ?)";
            PreparedStatement s = connect.prepareStatement(sql);
            s.setString(1, cityId);
            s.setString(2, districtId);
            s.setString(3, wardId);
            s.setString(4, description);
            s.setString(5, customerId);
            System.out.println(s.toString());

            s.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return false;
    }

    public  List<AddressCustomer> getAddress(String customerId) {
        List<AddressCustomer> re = new ArrayList<AddressCustomer>();
        String id="";
        String city="";
        String district="";
        String ward="";
        String description="";
        try {
            String sql = "SELECT * FROM address where idCustomer=?";
            PreparedStatement s = connect.prepareStatement(sql);
            s.setString(1, customerId);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                id = rs.getString("idAddress");
                city = rs.getString("idCity");
                district = rs.getString("idDistrict");
                ward = rs.getString("idWard");
                description = rs.getString("description");
                AddressCustomer adderssCustomer = new AddressCustomer(id, city, district, ward, description);
                re.add(adderssCustomer);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return re;
    }
    public boolean deleteAddress(String idAddress) {
        PreparedStatement s = null;
        String sql = "DELETE FROM address WHERE idAddress=?";
        try {
            s = connect.prepareStatement(sql);
            s.setString(1, idAddress);
            s.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public boolean editAddress(String idAddress, String idCity, String idDistrict, String idWard, String description) {
        PreparedStatement s = null;
        String sql = "UPDATE address SET idCity=?, idDistrict=?, idWard=?, description=? WHERE idAddress=?";
        try {
            s = connect.prepareStatement(sql);
            s.setString(1, idCity);
            s.setString(2, idDistrict);
            s.setString(3, idWard);
            s.setString(4, description);
            s.setString(5, idAddress);
            System.out.println(s.toString());
            s.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            System.out.println(s.toString());
            return false;
        }    }

}
