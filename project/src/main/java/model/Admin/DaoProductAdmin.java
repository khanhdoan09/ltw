package model.Admin;

import databaseConnection.DatabaseConnection;
import model.Image;
import model.ImgProduct;
import model.ProductDetail;
import model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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


    public Product getDetailProduct(String idPr) {
        try {
            String sql = "SELECT product.id, brand, name, category, price, saleRate,starRate, description,totalValue, soleValue, Active, create_at FROM product INNER JOIN linkimg ON product.id=linkimg.id && linkimg.level=0 WHERE product.id=?";
            PreparedStatement s = connect.prepareStatement(sql);
            s.setString(1, idPr);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                String id = rs.getString("id");
                String brand = rs.getString("brand");
                String name = rs.getString("name");
                String categoryP = rs.getString("category");
                double price = rs.getDouble("price");
                int saleRate = rs.getInt("saleRate");
                int starRate = rs.getInt("starRate");
                String description = rs.getString("description");
                int totalValue = rs.getInt("totalValue");
                int soleValue = rs.getInt("soleValue");
                int active = rs.getInt("Active");
                String create_at = rs.getString("create_at");
                List<ProductDetail> listSize =  getListProductDetail(id);
                List<Image> listImg = getListImg(id);
                Product product = new Product(id, brand, name, categoryP, price, saleRate, starRate, description, totalValue, soleValue, active, listSize, create_at, listImg);
                return product;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
    public List<ProductDetail> getListProductDetail(String idPr) {
        List<ProductDetail>list = new ArrayList<ProductDetail>();
        // get list size
        try {
            String sql = "SELECT DISTINCT size, color, totalValue, soleValue FROM  product_detail WHERE product_detail.id=? GROUP BY size, color ORDER BY size";
            PreparedStatement s = connect.prepareStatement(sql);
            s.setString(1, idPr);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                int size = rs.getInt("size");
                String color = rs.getString("color");
                int totalValue = rs.getInt("totalValue");
                int soleValue = rs.getInt("soleValue");
                list.add(new ProductDetail(color, size, totalValue, soleValue));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    private List<Image> getListImg(String id) {
        List<Image>list = new ArrayList<Image>();
        // get list size
        try {
            // main img
            String sql = "SELECT img,level,color FROM product JOIN linkimg ON product.id=linkimg.id WHERE product.id=? ";
            PreparedStatement s = connect.prepareStatement(sql);
            s.setString(1, id);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                String img = rs.getString("img");
                int level = rs.getInt("level");
                String color = rs.getString("color");
                list.add(new Image(img, level, color));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return list;   }

    public int editProduct(String id, Product product) {
        PreparedStatement s=null;
        try {
            String sql = "UPDATE product SET price=?, name=?, saleRate=?, description=?, totalValue=?, soleValue=?, category=? WHERE id=?";
            s = connect.prepareStatement(sql);
            s.setDouble(1, product.getPrice());
            s.setString(2,product.getName());
            s.setDouble(3, product.getSaleRate());
            s.setString(4, product.getDescription());
            s.setInt(5, product.getQuantity());
            s.setInt(6, product.getSoleValue());
            s.setString(7, product.getCategory());
            s.setString(8, id);
            return s.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            System.out.println(s.toString());
        }
        return 0;
    }
    public boolean deleteProductInAdmin(String id) {
        PreparedStatement s = null;
        String sql = "DELETE FROM product WHERE product.Id="+id;
        try {
            s = connect.prepareStatement(sql);
            System.out.println(s.executeUpdate());
            return true;
        } catch (SQLException e) {
            System.out.println("~~~*** sql word search header" + sql);
        }
        return false;
    }

    public boolean deleteDetailProductInAdmin(String id, int size, String color) {
        PreparedStatement s = null;
        String sql = "DELETE FROM product_detail WHERE id=? && size=? && color=? ";
        try {
            s = connect.prepareStatement(sql);
            s.setString(1, id);
            s.setInt(2, size);
            s.setString(3, color);
            s.executeUpdate();
            return true;
        } catch (SQLException e) {
            return false;
        }
    }

    public boolean editColor(String id, String colorNew, String colorOld) {
        PreparedStatement s = null;
        String sql = "UPDATE product_detail SET color=? WHERE id=? && color=?";
        PreparedStatement s2 = null;
        String sql2 = "UPDATE linkimg SET color=? WHERE id=? && color=?";
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

    public boolean addDetailProductInAdmin(String id, ProductDetail detail) {
        PreparedStatement s = null;
        String sql = "REPLACE INTO product_detail VALUES(?, ?, ?, ?,19/11/2020,2/11/2020, 1, ?)";
        // if data exists auto replace or not insert new
        try {
            s = connect.prepareStatement(sql);
            s.setString(1, id);
            s.setInt(2, detail.getSize());
            s.setInt(3, detail.getTotalValue());
            s.setInt(4, detail.getSoleValue());
            s.setString(5, detail.getColor());

            System.out.println(s.toString());
            s.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public boolean deleteImg(String id, String img) {
        PreparedStatement s = null;
        String sql = "DELETE FROM linkimg WHERE id=? && img=?";
        try {
            s = connect.prepareStatement(sql);
            s.setString(1, id);
            s.setString(2, img);
            s.executeUpdate();
            return true;
        } catch (SQLException e) {
            return false;
        }
    }

    public boolean saveImg(String id, String img, int level, String color) {
        PreparedStatement s = null;
        String sql = "INSERT INTO linkimg VALUES(?,?, ?, ?)";
        try {
            s = connect.prepareStatement(sql);
            s.setString(1, id);
            s.setString(2, img);
            s.setInt(3, level);
            s.setString(4, color);
            System.out.println(s.toString());
            s.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public List<String> getListColor(String id) {
        List<String>list = new ArrayList<String>();
        try {
            String sql = "SELECT DISTINCT color FROM linkimg WHERE id=? ";
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

}
