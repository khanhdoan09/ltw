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
import java.util.*;

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
        //            String sql = "SELECT product.id, brand, name, category, price, saleRate,starRate, description,totalValue, soleValue, Active, create_at FROM product INNER JOIN linkimg ON product.id=linkimg.id && linkimg.level=0 WHERE product.id=?";
        String sql = "SELECT product.id, brand, name, category, price, saleRate,starRate, description,totalValue, soleValue, Active, create_at FROM product WHERE product.id=?";
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
                List<ProductDetail> listSize =  getListProductDetail(id);
                List<Image> listImg = getListImg(id);
                Product product = new Product(id, brand, name, categoryP, price, saleRate, starRate, description, totalValue, soleValue, active, listSize, create_at, listImg);
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
            String sql = "UPDATE product SET price=?, name=?, saleRate=?, description=?, totalValue=?, soleValue=?, category=?, brand=? WHERE id=?";
            s = connect.prepareStatement(sql);
            s.setDouble(1, product.getPrice());
            s.setString(2,product.getName());
            s.setDouble(3, product.getSaleRate());
            s.setString(4, product.getDescription());
            s.setInt(5, product.getQuantity());
            s.setInt(6, product.getSoleValue());
            s.setString(7, product.getCategory());
            s.setString(8, product.getBrand());
            s.setString(9, id);
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

    public boolean removeColor(String id, String color) {
        PreparedStatement s = null;
        String sql = "DELETE FROM linkimg WHERE id=? && color=?";

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
            System.out.println(e.getMessage());
            System.out.println(s.toString());
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

    public boolean saveNewBrand(String brand) {
        PreparedStatement s = null;
        String sql = "INSERT INTO brand VALUES (?)";
        try {
            s = connect.prepareStatement(sql);
            s.setString(1, brand);
            s.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return false;
    }

    public boolean changeLevelImg(String img,String color, String id) {
        PreparedStatement s2 = null;
        String sql2 = "UPDATE linkimg SET level=1 WHERE id=? AND color=?";
        PreparedStatement s = null;
        String sql = "UPDATE linkimg SET level=0 WHERE id=? AND img=?";
        try {
            s2 = connect.prepareStatement(sql2);
            s2.setString(1, id);
            s2.setString(2, color);
            s2.executeUpdate();

            s = connect.prepareStatement(sql);
            s.setString(1, id);
            s.setString(2, img);
            s.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return false;
    }
}

