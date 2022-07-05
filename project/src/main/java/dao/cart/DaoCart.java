package dao.cart;

import beans.ProductInCart;
import database.DatabaseConnection;
import dao.product.DaoProduct;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoCart {
    private static DaoCart instance = null;

    public static DaoCart getInstance() {
        if (instance == null)
            instance = new DaoCart();
        return instance;
    }
    Connection connect = DatabaseConnection.getConnection();

    private DaoCart() {

    }

    public List<ProductInCart> getListProductInCart(String idCustomer) {
        List<ProductInCart> re = new ArrayList<ProductInCart>();
        try {
            String sql = "SELECT * FROM cart WHERE idCustomer=?";
            PreparedStatement s = connect.prepareStatement(sql);
            s.setString(1, idCustomer);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                String idProduct = rs.getString("idProduct");
                String colorShoe= rs.getString("colorShoe");
                int quantity =  rs.getInt("quantity");
                int size = rs.getInt("size");
                String name= DaoProduct.getInstance().getName(idProduct);
                String brand= DaoProduct.getInstance().getBrand(idProduct);
                double price = DaoProduct.getInstance().getPrice(idProduct);
                ProductInCart productInCart = new ProductInCart(idCustomer, idProduct, colorShoe, quantity, size, name, brand, price);
                re.add(productInCart);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return re;
    }

    // lấy số sản phẩm trong cart để trên header
    public int getProductAmountInCart(String idCustomer) {
        int re = 0;
        try {
            String sql = "SELECT * FROM cart WHERE idCustomer=?";
            PreparedStatement s = connect.prepareStatement(sql);
            s.setString(1, idCustomer);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
             re ++;
            }
            return re;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return re;
    }

    public boolean insertShoeToCart(ProductInCart productInCart) {
        PreparedStatement s=null;
        try {
            // dùng REPLACE INTO để nếu có sp đã tồn tại thì update còn không thì insert
            String sql = "REPLACE INTO cart (idCustomer, idProduct, colorShoe, quantity, size) VALUES (?, ?, ?, ?, ?)";
            s = connect.prepareStatement(sql);
            s.setString(1, productInCart.getIdCustomer());
            s.setString(2, productInCart.getIdProduct());
            s.setString(3, productInCart.getColorShoe());
            s.setInt(4, productInCart.getQuantityShoe());
            s.setInt(5, productInCart.getSizeShoe());
            s.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage() +"~~");
            System.out.println(s.toString() +"::");
        }
        return false;
    }

    public List<ProductInCart> getListProductInCart(String idCustomer, String name, String brand, double price) {
        List<ProductInCart> re = new ArrayList<ProductInCart>();
        try {
            String sql = "SELECT * FROM cart WHERE idCustomer=?";
            PreparedStatement s = connect.prepareStatement(sql);
            s.setString(1, idCustomer);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
              ProductInCart productInCart = new ProductInCart(rs.getString("idCustomer"), rs.getString("idProduct"), rs.getString("colorShoe"), rs.getInt("quantity"), rs.getInt("size"), name, brand, price);
              re.add(productInCart);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return re;
    }

    public boolean updateQuantityShoe(ProductInCart productInCart) {
        PreparedStatement s = null;
        String sql = "UPDATE cart SET quantity=?  WHERE idCustomer=? AND idProduct=? AND size=? AND colorShoe=?";
        try {
            s = connect.prepareStatement(sql);
            s.setInt(1, productInCart.getQuantityShoe());
            s.setString(2, productInCart.getIdCustomer());
            s.setString(3, productInCart.getIdProduct());
            s.setInt(4, productInCart.getSizeShoe());
            s.setString(5, productInCart.getColorShoe());
            s.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return false;
    }

    public boolean deleteProductInCart(ProductInCart productInCart) {
        PreparedStatement s = null;
        String sql = "DELETE FROM cart WHERE idCustomer=? AND idProduct=? AND colorShoe=? AND size=?";
        try {
            s = connect.prepareStatement(sql);
            s.setString(1, productInCart.getIdCustomer());
            s.setString(2, productInCart.getIdProduct());
            s.setString(3, productInCart.getColorShoe());
            s.setInt(4, productInCart.getSizeShoe());
            s.executeUpdate();
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
}
