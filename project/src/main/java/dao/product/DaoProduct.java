package dao.product;

import beans.Product;
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
            ResultSet rs = s.executeQuery("SELECT product.id, brand, name, category, price, saleRate,starRate, description,totalValue, soleValue, Active,img FROM product inner join linkimg on product.id=linkimg.id where linkimg.level=0");
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
            String sql = "SELECT product.id, brand, name, category, price, saleRate,starRate, description,totalValue, soleValue, Active, create_at, mainColor FROM product INNER JOIN linkimg ON product.id=linkimg.id && linkimg.level=0 WHERE product.id=?";
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
            String sql = "SELECT DISTINCT product.id, brand, name, category, price, saleRate, Active, img FROM product INNER JOIN linkimg ON product.id=linkimg.id && linkimg.level=0 WHERE product.id=?";
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
            String sql = "SELECT img FROM product JOIN linkimg ON product.id=linkimg.id && linkimg.level=0 WHERE product.id=? ";
            PreparedStatement s = connect.prepareStatement(sql);
            s.setString(1, id);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                String main = rs.getString("img");
                mainImg.add(main);
            }

            // list sub img
            sql = "SELECT img FROM product JOIN linkimg ON product.id=linkimg.id && linkimg.level=1 WHERE product.id=? ";
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

//    public String getProductByCategory(String attrProduct, String[] category) {
//        List<Product> re = new ArrayList<Product>();
//        String sql = "";
//        if (attrProduct.equals("id")) {
//                sql += " product.id=? || ";
//        }
//        if (attrProduct.equals("name")) {
//            sql += "(";
//            for (int i = 0; i < category.length; i++)
//                sql += " product.name=? || ";
//        }
//        if (attrProduct.equals("brand")) {
//            sql += "(";
//            for (int i = 0; i < category.length; i++)
//                sql += " brand=? || ";
//        }
//        else if (attrProduct.equals("size")) {
//            sql += "(";
//            for (int i = 0; i < category.length; i++)
//                sql += " size=? || ";
//        }
//        else if (attrProduct.equals("underPrice")) {
//            for (int i = 0; i < category.length; i++)
//                sql += " price < ? || ";
//
//        } else if (attrProduct.equals("upPrice")) {
//            for (int i = 0; i < category.length; i++)
//                sql += " price > ? || ";
//        } else if (attrProduct.equals("fromToPrice")) {
//            sql += " price BETWEEN ? AND ? || ";
//        }
//        else if (attrProduct.equals("highestPrice")){
//            sql += " GROUP BY product.id ORDER BY price DESC    ";
//        }
//        else if (attrProduct.equals("lowestPrice")){
//            sql += " GROUP BY product.id ORDER BY price ASC    ";
//        }
//        else if (attrProduct.equals("star")){
//            sql += "(";
//            for (int i = 0; i < category.length; i++)
//                sql += " starRate=? || ";
//        }
//        else if (attrProduct.equals("searchInHeader")) {
//            sql += "(";
//            sql += "name LIKE ?     ";
//        }
//        sql = sql.substring(0, sql.length() - 4); // to remove ||
//        if (!attrProduct.equals("highestPrice") && !attrProduct.equals("lowestPrice")){
//            sql+=")";
//        }
//        return sql;
//    }

//    public List<Product> excQuery(ArrayList<String> category,  String sql) {
//        PreparedStatement s = null;
//        List<Product> re = new ArrayList<Product>();
//        try {
//            s = connect.prepareStatement(sql);
//            for (int i = 0; i < category.size(); i++) {
//                s.setString(i + 1, category.get(i));
//            }
//            ResultSet rs = s.executeQuery();
//            while (rs.next()) {
//                String id = rs.getString("id");
//                String brand = rs.getString("brand");
//                String name = rs.getString("name");
//                String categoryP = rs.getString("category");
//                double price = rs.getDouble("price");
//                int saleRate = rs.getInt("saleRate");
//                int active = rs.getInt("Active");
//                String avatar = rs.getString("img");
//                Product product = new Product(id, brand, name, categoryP, price, saleRate, active, avatar);
//                re.add(product);
//            }
//            System.out.println(s.toString());
//
//        } catch (SQLException e) {
//            e.printStackTrace();
//            System.out.println("~~~ " + s.toString());
//        }
//        // reset sql
//
//        return re;
//    }

//    public int getCountProduct(ArrayList<String> key, String sqlCount) {
//        int re = 0;
//        PreparedStatement s = null;
//        try {
//            s = connect.prepareStatement(sqlCount);
//            for (int i = 0; i < key.size(); i++) {
//                s.setString(i +1, key.get(i));
//            }
//            ResultSet rs = s.executeQuery();
//            while (rs.next()) {
//                re = rs.getInt(1);
//            }
//            System.out.println(re);
//        } catch (SQLException e) {
//            e.printStackTrace();
//            System.out.println("!!! "+sqlCount);
//        }
//        return re;
//    }

//    public List<Product> getProductByCategoryByNav(String attrProduct, String category, int pagination) {
//        List<Product> re = new ArrayList<Product>();
//        String sqlNav = "SELECT DISTINCT product.id, brand, name, category, price, saleRate, Active, img FROM product INNER JOIN linkimg ON product.id=linkimg.id && linkimg.level=0 WHERE";
//
//        if (attrProduct.equals("categoryOnNav")) {
//            sqlNav += " category=?";
//
//            sql = "SELECT id, brand, name, category, price, saleRate, Active FROM product WHERE category=\"" + category + "\" && (";
//        } else if (attrProduct.equals("brandOnNav")) {
//            sqlNav += " brand=?";
//        }
//        sqlNav += " GROUP BY product.id " + limit;
//        System.out.println(sqlNav);
//        PreparedStatement s = null;
//        try {
//            s = connect.prepareStatement(sqlNav);
//            s.setString(1, category);
//            s.setInt(2, (pagination - 1) * 9);
//            s.setInt(3, 9);
//
//            ResultSet rs = s.executeQuery();
//            System.out.println(s.toString());
//            while (rs.next()) {
//                String id = rs.getString("id");
//                String brand = rs.getString("brand");
//                String name = rs.getString("name");
//                String categoryP = rs.getString("category");
//                double price = rs.getDouble("price");
//                int saleRate = rs.getInt("saleRate");
//                int active = rs.getInt("Active");
//                String avatar = rs.getString("img");
//                Product product = new Product(id, brand, name, categoryP, price, saleRate, active, avatar);
//
//                re.add(product);
//            }
//        } catch (SQLException e) {
//            System.out.println("~~~*** " + sqlNav);
//        }
//        return re;
//    }

//    public List<Product> getDataFromWordInSearchHeader(String word) {
//        List<Product> re = new ArrayList<Product>();
//        PreparedStatement s = null;
//        String sql = "SELECT DISTINCT name, id FROM product WHERE name LIKE ? GROUP BY name LIMIT 0, 10";
//        try {
//            s = connect.prepareStatement(sql);
//            s.setString(1, "%"+word+"%");
//
//            ResultSet rs = s.executeQuery();
//            while (rs.next()) {
//                String id = rs.getString("id");
//                String name = rs.getString("name");
//                re.add(new Product(id, name));
//            }
//        } catch (SQLException e) {
//            System.out.println("~~~*** sql word search header" + sql);
//        }
//        return re;
//    }

//    public String analysisArrayList(List<Product> list) {
//        String re = "";
//        for (Product p : list)
//            re += p.getId()+"@@##**"+p.getName() + "\n"; // to split id and name
//        return re.trim();
//    }


    public List<Product> getListHotProduct(String id) {
        List<Product> re = new ArrayList<Product>();
        PreparedStatement s = null;
        String sql = "SELECT DISTINCT product.id, brand, name, category, price, saleRate, Active, img FROM product INNER JOIN linkimg ON product.id=linkimg.id && linkimg.level=0 WHERE product.id!=? ORDER BY starRate, saleRate DESC LIMIT 0, 5";
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
            System.out.println("~~~*** sql word search header " + sql);
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
            System.out.println("~~~*** sql word search header " + sql);
        }
        return re;
    }

    public List<String> getListSubImg(String id, String color) {
        List<String> re = new ArrayList<String>();
        PreparedStatement s = null;
        String sql = "SELECT img FROM linkimg WHERE id=? AND color=? AND level=1";
        try {
            s = connect.prepareStatement(sql);
            s.setString(1, id);
            s.setString(2, color);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                re.add(rs.getString("img"));
            }
        } catch (SQLException e) {
            System.out.println("~~~*** sql word search header " + sql);
        }
        return re;
    }

    public String getMainImg(String id, String color) {
        PreparedStatement s = null;
        String sql = "SELECT img FROM linkimg WHERE id=? AND color=? AND level=0";
        try {
            s = connect.prepareStatement(sql);
            s.setString(1, id);
            s.setString(2, color);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                return rs.getString("img");
            }
        } catch (SQLException e) {
            System.out.println("~~~*** sql word search header " + sql);
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
            System.out.println("~~~*** sql word search header " + sql);
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
            System.out.println("~~~*** sql word search header " + sql);
        }
        return "";
    }

    // home page
    public List<Product> getBestSale() {
        List<Product>re = new ArrayList<Product>();
        try {
            String sql = "SELECT product.id, brand, name, category, price, saleRate, Active, img FROM product INNER JOIN linkimg ON product.id=linkimg.id && linkimg.level=0 && linkimg.color=product.mainColor ORDER BY product.saleRate DESC LIMIT 0, 10;";
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
            String sql = " SELECT product.id, brand, name, category, price, saleRate, Active, img FROM product INNER JOIN linkimg ON product.id=linkimg.id && linkimg.level=0 && linkimg.color=product.mainColor ORDER BY (product.totalValue/product.soleValue) LIMIT 0, 10;";
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
            String sql = "SELECT product.id, brand, name, category, price, saleRate, Active, img FROM product INNER JOIN linkimg ON product.id=linkimg.id && linkimg.level=0 && linkimg.color=product.mainColor ORDER BY product.create_at DESC LIMIT 0, 10";
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
}