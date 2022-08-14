package dao.product;

import beans.Product;
import beans.Comment;
import beans.ProductDetail;
import beans.ImgProduct;
import database.DatabaseConnection;
import dao.product.brand.DaoProductBrand;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DaoProduct  {

    private static DaoProduct instance = null;



    public static DaoProduct getInstance() {
        if (instance == null)
            instance = new DaoProduct();
        return instance;
    }

    private DaoProduct() {

    }

    private ArrayList<Product> list = new ArrayList<Product>();

    Connection connect = DatabaseConnection.getConnection();

    public Product getProductById(String idPr) {
        List<Product> re = new ArrayList<Product>();
        try {
            Statement s = connect.createStatement();
            ResultSet rs = s.executeQuery("SELECT product.id, brand, name, category, price, saleRate,starRate, description,totalValue, soleValue, Active,img FROM product inner join linkimg on product.id=linkimg.idProduct where linkimg.level=0");
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
                String avatar = rs.getString("img");
                Product product = new Product(id, brand, name, categoryP, price, saleRate, starRate, description, totalValue, soleValue, active,avatar);

                if (id.equals(idPr)) {
                    return product;
                }
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public Product getDetailProduct(String idPr) {
        try {
            String sql = "SELECT product.id, brand, name, category, price, saleRate,starRate, description,totalValue, soleValue, Active, create_at, mainColor FROM product INNER JOIN linkimg ON product.id=linkimg.idProduct && linkimg.level=0 WHERE product.id=?";
            PreparedStatement s = connect.prepareStatement(sql);
            s.setString(1, idPr);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                String id = rs.getString("id");
                String idBrand = rs.getString("brand");
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
                String mainColor = rs.getString("mainColor");
                List<ProductDetail> listSize =  getListProductDetail(id);
                ImgProduct listImg = getListImg(id);
                String nameBrand = DaoProductBrand.getInstance().getNameBrand(idBrand);
                Product product = new Product(id, nameBrand, name, categoryP, price, saleRate, starRate, description, totalValue, soleValue, active, listSize, create_at, listImg, mainColor);
                return product;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public Product getWatchedProduct(String idPr) {
        try {
            String sql = "SELECT DISTINCT product.id, brand, name, category, price, saleRate, Active, img FROM product INNER JOIN linkimg ON product.id=linkimg.idProduct && linkimg.level=0 WHERE product.id=?";
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
                int active = rs.getInt("Active");
                String avatar = rs.getString("img");
                Product product = new Product(id, brand, name, categoryP, price, saleRate, active, avatar);

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



    private ImgProduct getListImg(String id) {
        List<String> mainImg = new ArrayList<String>();
        List<String> subImg = new ArrayList<String>();
        // get list size
        try {
            // main img
            String sql = "SELECT img FROM product JOIN linkimg ON product.id=linkimg.idProduct && linkimg.level=0 WHERE product.id=? ";
            PreparedStatement s = connect.prepareStatement(sql);
            s.setString(1, id);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                String main = rs.getString("img");
                mainImg.add(main);
            }

            // list sub img
            sql = "SELECT img FROM product JOIN linkimg ON product.id=linkimg.idProduct && linkimg.level=1 WHERE product.id=? ";
            s = connect.prepareStatement(sql);
            s.setString(1, id);
            rs = s.executeQuery();
            while (rs.next()) {
                String sub = rs.getString("img");
                subImg.add(sub);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }


        ImgProduct img = new ImgProduct(mainImg, subImg);

        return img;   }

    public String sql = "";

    private String limit = " LIMIT ?, ?";

    public List<Product> getListHotProduct(String id) {
        List<Product> re = new ArrayList<Product>();
        PreparedStatement s = null;
        String sql = "SELECT DISTINCT product.id, brand, name, category, price, saleRate, Active, img FROM product INNER JOIN linkimg ON product.id=linkimg.idProduct && linkimg.level=0 WHERE product.id!=? ORDER BY starRate, saleRate DESC LIMIT 0, 5";
        try {
            s = connect.prepareStatement(sql);
            s.setString(1, id);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                String idCur = rs.getString("id");
                String brand = rs.getString("brand");
                String name = rs.getString("name");
                String categoryP = rs.getString("category");
                double price = rs.getDouble("price");
                int saleRate = rs.getInt("saleRate");
                int active = rs.getInt("Active");
                String avatar = rs.getString("img");
                Product product = new Product(idCur, brand, name, categoryP, price, saleRate, active, avatar);
                re.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return re;
    }

    public List<Integer> getListSize(String id, String color) {
        List<Integer> re = new ArrayList<Integer>();
        PreparedStatement s = null;
        String sql="SELECT DISTINCT size FROM product INNER JOIN product_detail ON product.id=product_detail.id WHERE product.id=? AND product_detail.color=? GROUP BY size";
        try {
            s = connect.prepareStatement(sql);
            s.setString(1, id);
            s.setString(2, color);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                re.add(rs.getInt("size"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return re;
    }

    public List<String> getListSubImg(String id, String color) {
        List<String> re = new ArrayList<String>();
        PreparedStatement s = null;
        String sql = "SELECT img FROM linkimg WHERE idProduct=? AND color=? AND level=1";
        try {
            s = connect.prepareStatement(sql);
            s.setString(1, id);
            s.setString(2, color);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                re.add(rs.getString("img"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return re;
    }

    public String getMainImg(String id, String color) {
        PreparedStatement s = null;
        String sql = "SELECT img FROM linkimg WHERE idProduct=? AND color=? AND level=0";
        try {
            s = connect.prepareStatement(sql);
            s.setString(1, id);
            s.setString(2, color);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                return rs.getString("img");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return "";
    }

    public int getRemainProductDetail(String id, String color) {
        PreparedStatement s = null;
        String sql = "SELECT totalValue, soleValue FROM product_detail WHERE id=? AND color=?";
        try {
            s = connect.prepareStatement(sql);
            s.setString(1, id);
            s.setString(2, color);
            ResultSet rs = s.executeQuery();
            int total=0;
            int sole=0;
            while (rs.next()) {
                total = rs.getInt("totalValue");
                sole = rs.getInt("soleValue");
            }
            return total-sole;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return 0;
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
            System.out.println(e.getMessage());
        }
        return "";
    }

    // home page
    public List<Product> getBestSale() {
        List<Product>re = new ArrayList<Product>();
        try {
            String sql = "SELECT product.id, brand, name, category, price, saleRate, Active, img FROM product INNER JOIN linkimg ON product.id=linkimg.idProduct && linkimg.level=0 && linkimg.color=product.mainColor ORDER BY product.saleRate DESC LIMIT 0, 10;";
            PreparedStatement s = connect.prepareStatement(sql);
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
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return re;
    }

    public List<Product> getBestSeller() {
        List<Product>re = new ArrayList<Product>();
        try {
            String sql = " SELECT product.id, brand, name, category, price, saleRate, Active, img FROM product INNER JOIN linkimg ON product.id=linkimg.idProduct && linkimg.level=0 && linkimg.color=product.mainColor ORDER BY (product.totalValue/product.soleValue) LIMIT 0, 10;";
            PreparedStatement s = connect.prepareStatement(sql);
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
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return re;
    }

    public List<Product> getNewestProduct() {
        List<Product>re = new ArrayList<Product>();
        try {
            String sql = "SELECT product.id, brand, name, category, price, saleRate, Active, img FROM product INNER JOIN linkimg ON product.id=linkimg.idProduct && linkimg.level=0 && linkimg.color=product.mainColor ORDER BY product.create_at DESC LIMIT 0, 10";
            PreparedStatement s = connect.prepareStatement(sql);
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
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return re;
    }

    public String getName(String idProduct) {
        try {
            String sql = "SELECT name FROM product WHERE id=?";
            PreparedStatement s = connect.prepareStatement(sql);
            s.setString(1, idProduct);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                return rs.getString("name");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return "";
    }
    public String getBrand(String idProduct) {
        try {
            String sql = "SELECT brand FROM product WHERE id=?";
            PreparedStatement s = connect.prepareStatement(sql);
            s.setString(1, idProduct);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                return rs.getString("brand");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return "";
    }
    public double getPrice(String idProduct) {
        try {
            String sql = "SELECT price FROM product WHERE id=?";
            PreparedStatement s = connect.prepareStatement(sql);
            s.setString(1, idProduct);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                return rs.getDouble("price");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

    public boolean checkActive(String idProduct) {
        try {
            String sql = "SELECT Active FROM product WHERE id=?";
            PreparedStatement s = connect.prepareStatement(sql);
            s.setString(1, idProduct);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                String active = rs.getString("Active");
                if (active.equals("1")) {
                    return true;
                }
                return false;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return false;
    }

}