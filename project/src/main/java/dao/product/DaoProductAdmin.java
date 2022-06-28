package dao.product;

import beans.Product;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import connection.DatabaseConnection;


public class DaoProductAdmin {
    private static DaoProductAdmin instance = null;

    public static DaoProductAdmin getInstance() {
        if (instance == null)
            instance = new DaoProductAdmin();
        return instance;
    }
    private DaoProductAdmin() {

    }

    Connection connect = DatabaseConnection.getConnection();



    public int editProduct(String id, Product product) {
        PreparedStatement s=null;
        try {
            String sql = "UPDATE product SET price=?, name=?, saleRate=?, description=?, totalValue=?, soleValue=?, category=?, brand=?, Active=?, create_at=? WHERE id=?";
            s = connect.prepareStatement(sql);
            s.setDouble(1, product.getPrice());
            s.setString(2,product.getName());
            s.setDouble(3, product.getSaleRate());
            s.setString(4, product.getDescription());
            s.setInt(5, product.getQuantity());
            s.setInt(6, product.getSoleValue());
            s.setString(7, product.getCategory());
            s.setString(8, product.getBrand());
            s.setInt(9, product.getActive());
            s.setString(10, product.getCreate_at());
            s.setString(11, id);

            return s.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            System.out.println(s.toString());
        }
        return 0;
    }
    public boolean deleteProductInAdmin(String id, HttpServletRequest request) {
        File productDir = new File(request.getServletContext().getAttribute("FILES_DIR") + File.separator + "product");
        if (!productDir.exists()) {
            productDir.mkdirs();
        }
        PreparedStatement s = null;
        String sql = "DELETE FROM product WHERE product.Id="+id;

        PreparedStatement s2 = null;
        String sql2 = "SELECT * FROM linkimg WHERE id="+id;
        try {
            s2 = connect.prepareStatement(sql2);
            System.out.println("~"+s2.toString());
            ResultSet rs = s2.executeQuery();
            while (rs.next()) {
                String src = rs.getString("img");
                System.out.println(src);
                File file = new File(productDir.getAbsolutePath() + File.separator + src+".jpg");
                System.out.println(file.getAbsolutePath());
                if (file.delete()) {
                    System.out.println("Deleted the file: " + file.getName());
                } else {
                    System.out.println("Failed to delete the file.");
                }
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }

        try {
            s = connect.prepareStatement(sql);
            System.out.println(s.executeUpdate());
            return true;
        } catch (SQLException e) {
            System.out.println("~~~*** sql word search header" + sql);
        }
        return false;
    }


    public boolean addProduct(Product product) {
        PreparedStatement s=null;
        try {
            String sql = "INSERT INTO product (brand, name, category, price, saleRate, starRate, totalValue, soleValue, create_at, update_at,description, Active) VALUES (?,?, ?, ?,?,?,?,?,?,?,?,?)";
            s = connect.prepareStatement(sql);
            s.setString(1, product.getBrand());
            s.setString(2,product.getName());
            s.setString(3, "Sneakers Man");
            s.setDouble(4, product.getPrice());
            s.setDouble(5, product.getSaleRate());
            s.setInt(6, product.getStarRate());
            s.setInt(7, 0);
            s.setInt(8, 0);
            s.setString(9, product.getCreate_at());
            s.setString(10,product.getUpdate_at());
            s.setString(11, product.getDescription());
            s.setInt(12, product.getActive()+0);
            System.out.println(product.getName() +" 123");
            s.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage() +"~~");
            System.out.println(s.toString() +"::");
        }
        return false;
    }

    public String getAutoIncrement() {
        String re="";
        PreparedStatement s = null;
        String sql = "SELECT `AUTO_INCREMENT` FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'product'";
        try {
            s = connect.prepareStatement(sql);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                re = rs.getString("AUTO_INCREMENT");
            }
            return re;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return "null";
    }

    public boolean saveActive(String id, String active) {
        PreparedStatement s = null;
        String sql = "UPDATE product SET Active=? WHERE id=?";
        try {
            s = connect.prepareStatement(sql);
            s.setString(1, active);
            s.setString(2, id);
            s.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return false;
    }


    public List<Product> excQuery(String category,  String sql) {
        PreparedStatement s = null;
        List<Product> re = new ArrayList<Product>();
        try {
            s = connect.prepareStatement(sql);
            s.setString( 1, category);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                String id = rs.getString("id");
                String brand = rs.getString("brand");
                String name = rs.getString("name");
                String categoryP = rs.getString("category");
                double price = rs.getDouble("price");
                int saleRate = rs.getInt("saleRate");
                int active = rs.getInt("Active");
                String avatar = rs.getString("img");
                Product product = new Product(id, brand, name, categoryP, price, saleRate, active, avatar);
                re.add(product);
            }
            System.out.println(s.toString());

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("~~~ " + s.toString());
        }
        // reset sql

        return re;
    }

    public String getMainColor(String id) {
        PreparedStatement s = null;
        String sql = "SELECT mainColor FROM product WHERE id=?";
        try {
            s = connect.prepareStatement(sql);
            s.setString(1, id);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                return rs.getString("mainColor");
            }
        } catch (SQLException e) {
            System.out.println("~~~*** sql word search header " + sql);
        }
        return "";
    }

    public int addNewProduct(Product product) {
        PreparedStatement s = null;
        String sql = "Insert INTO product(price, saleRate, brand, name, create_at, description) VALUES(?, ?, ? ,?, ?, ?)";
        try {
            s = connect.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            s.setDouble(1, product.getPrice());
            s.setDouble(2, product.getSalePrice());
            s.setString(3, product.getBrand());
            s.setString(4, product.getName());
            s.setString(5, product.getCreate_at());
            s.setString(6, product.getDescription());
            // return id of auto increment
            s.executeUpdate();
            ResultSet rs = s.getGeneratedKeys();
            rs.next();
            return rs.getInt(1);
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return 0;
        }
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
