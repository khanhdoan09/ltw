package dao.product.detail;
import database.DatabaseConnection;

import beans.Image;
import beans.Product;
import beans.ProductDetail;
import dao.product.image.DaoProductImage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoProductDetail {
    private static DaoProductDetail instance = null;

    public static DaoProductDetail getInstance() {
        if (instance == null)
            instance = new DaoProductDetail();
        return instance;
    }
    private DaoProductDetail() {

    }
    Connection connect = DatabaseConnection.getConnection();

    public Product getDetailProduct(String idPr) {
        String sql = "SELECT product.id, brand, name, category, price, saleRate,starRate, description,totalValue, soleValue, Active, create_at, gender FROM product WHERE product.id=?";
        PreparedStatement s = null;
        try {
            s= connect.prepareStatement(sql);
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
                String gender = rs.getString("gender");
                List<ProductDetail> listSize =  getListProductDetail(id);
                List<Image> listImg = DaoProductImage.getInstance().getListImg(id);
                Product product = new Product(id, brand, name, categoryP, price, saleRate, starRate, description, totalValue, soleValue, active, listSize, create_at, listImg, gender);
                return product;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage() +"\n"+s.toString());
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

    // check lai co can sua sql hay bo ham nay khong
    public boolean addDetailProductInAdmin(String id, ProductDetail detail) {
        PreparedStatement s = null;
        String date = java.time.LocalDate.now().toString();
        String sql = "REPLACE INTO product_detail VALUES(?, ?, ?, ?, ?, ?, 1, ?)";
        // if data exists auto replace or not insert new
        try {
            s = connect.prepareStatement(sql);
            s.setString(1, id);
            s.setInt(2, detail.getSize());
            s.setInt(3, detail.getTotalValue());
            s.setInt(4, detail.getSoleValue());
            s.setString(5, date);
            s.setString(6, date);
            s.setString(7, detail.getColor());


            System.out.println(s.toString());
            s.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }
    }
}
