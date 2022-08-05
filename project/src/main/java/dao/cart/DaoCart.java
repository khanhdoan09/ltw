package dao.cart;

import beans.Cart;
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

    public List<Cart> getListProductInCart(String idCustomer) {
        List<Cart> re = new ArrayList<Cart>();
        try {
            String sql = "SELECT * FROM cart INNER JOIN product_detail WHERE idCustomer=? AND cart.idProductDetail=product_detail.idDetail";
            PreparedStatement s = connect.prepareStatement(sql);
            s.setString(1, idCustomer);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                String idProduct = rs.getString("id");
                String idProductDetail = rs.getString("idProductDetail");
                String colorShoe= rs.getString("color");
                int quantity =  rs.getInt("quantity");
                int size = rs.getInt("size");
                String name= DaoProduct.getInstance().getName(idProduct);
                String brand= DaoProduct.getInstance().getBrand(idProduct);
                double price = DaoProduct.getInstance().getPrice(idProduct);
                Cart cart = new Cart(idCustomer, idProduct, idProductDetail, colorShoe, quantity, size, name, brand, price);
                re.add(cart);
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

    public boolean insertShoeToCart(Cart cart) {
        PreparedStatement s=null;
        try {
            // dùng REPLACE INTO để nếu có sp đã tồn tại trong cart roi thì update còn không thì insert
            String sql = "REPLACE INTO cart (idCustomer, idProductDetail, quantity) VALUES (?, ?, ?)";
            s = connect.prepareStatement(sql);
            s.setString(1, cart.getIdCustomer());
            s.setString(2, cart.getIdProductDetail());
            s.setInt(3, cart.getQuantityShoe());
            s.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return false;
    }


    public boolean updateQuantityShoe(Cart cart) {
        PreparedStatement s = null;
        String sql = "UPDATE cart SET quantity=? WHERE idCustomer=? AND idProductDetail=?";
        try {
            s = connect.prepareStatement(sql);
            s.setInt(1, cart.getQuantityShoe());
            s.setString(2, cart.getIdCustomer());
            s.setString(3, cart.getIdProductDetail());
            s.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return false;
    }

    public boolean deleteProductInCart(Cart cart) {
        PreparedStatement s = null;
        String sql = "DELETE FROM cart WHERE idCustomer=? AND idProductDetail=?";
        try {
            s = connect.prepareStatement(sql);
            s.setString(1, cart.getIdCustomer());
            s.setString(2, cart.getIdProductDetail());
            s.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }
    }


}
