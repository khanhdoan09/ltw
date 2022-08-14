package dao.user;

import database.DatabaseConnection;
import beans.AddressCustomer;

import java.sql.*;
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

            String sql = "REPLACE INTO address(idCity, idDistrict, idWard, description, idCustomer, isTemporary) VALUES(?, ?, ?, ?, ?, 0)";
            PreparedStatement s = connect.prepareStatement(sql);
            s.setString(1, cityId);
            s.setString(2, districtId);
            s.setString(3, wardId);
            s.setString(4, description);
            s.setString(5, customerId);
            s.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return false;
    }

    public String addAddressTemporary(AddressCustomer addressCustomer) {
        String idAdress = "";
        try {
            String sql = "REPLACE INTO address(idCity, idDistrict, idWard, description, idCustomer, isTemporary) VALUES(?, ?, ?, ?, ?, ?)";
            PreparedStatement s = connect.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            s.setString(1, addressCustomer.getCity());
            s.setString(2, addressCustomer.getDistrict());
            s.setString(3, addressCustomer.getWard());
            s.setString(4, addressCustomer.getDescription());
            s.setString(5, addressCustomer.getIdCustomer());
            s.setString(6, addressCustomer.isTemporary());
            s.executeUpdate();
            ResultSet rs = s.getGeneratedKeys();
            rs.next();
            idAdress = String.valueOf(rs.getInt(1));
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return idAdress;
    }

    // không lấy địa chỉ tạm thời
    public  List<AddressCustomer> getAddress(String customerId) {
        List<AddressCustomer> re = new ArrayList<AddressCustomer>();
        String id="";
        String city="";
        String district="";
        String ward="";
        String description="";
        try {
            String sql = "SELECT * FROM address where idCustomer=? and isTemporary=1";
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

    public String  getAddressFromOrder(String orderId) {
        String id="";
        String city="";
        String district="";
        String ward="";
        String description="";
        try {
            String sql = "SELECT * FROM orders inner join address on orders.idAddress=address.idAddress where orders.id=?";
            PreparedStatement s = connect.prepareStatement(sql);
            s.setString(1, orderId);
            System.out.println(s.toString());
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                String re = rs.getString("idCity")+"/"+rs.getString("idDistrict")+"/"+rs.getString("idWard")+"/"+rs.getString("description");
              return re;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return "";
    }
    public boolean deleteAddress(String idAddress, String idCustomer) {
        PreparedStatement s = null;
        String sql = "DELETE FROM address WHERE idAddress=? AND idCustomer=?";
        try {
            s = connect.prepareStatement(sql);
            s.setString(1, idAddress);
            s.setString(2, idCustomer);
            s.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public boolean editAddress(String idCustomer, String idAddress, String idCity, String idDistrict, String idWard, String description) {
        PreparedStatement s = null;
        String sql = "UPDATE address SET idCity=?, idDistrict=?, idWard=?, description=? WHERE idAddress=? AND idCustomer=?";
        try {
            s = connect.prepareStatement(sql);
            s.setString(1, idCity);
            s.setString(2, idDistrict);
            s.setString(3, idWard);
            s.setString(4, description);
            s.setString(5, idAddress);
            s.setString(6, idCustomer);
            s.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            System.out.println(s.toString());
            return false;
        }    }

}
