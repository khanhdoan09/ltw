package dao.checkout;

import beans.ProductInCheckout;
import beans.ProductInCart;
import connection.DatabaseConnection;
import dao.cart.DaoCart;

import java.sql.*;
import java.time.LocalDate;
import java.util.List;

public class DaoCheckout {
    private static DaoCheckout instance = null;

    public static DaoCheckout getInstance() {
        if (instance == null)
            instance = new DaoCheckout();
        return instance;
    }
    Connection connect = DatabaseConnection.getConnection();

    private DaoCheckout() {
    }

    public int saveOrder(String idCustomer, double totalPrice) {
        PreparedStatement s=null;
        LocalDate today = java.time.LocalDate.now();
        try {
            String sql = "INSERT INTO `orders` (`customer`, `total_price`, `create_at`, `status`) VALUES (?, ?, ?, ?)";
            s = connect.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            s.setString(1, idCustomer);
            s.setDouble(2, totalPrice);
            s.setString(3, today.toString());
            s.setString(4, "đang giao");
            s.executeUpdate();

            // lấy id order được tự động tạo ra sau khi insert
            ResultSet rs = s.getGeneratedKeys();
            rs.next();
            int idOrderCreated = rs.getInt(1);
            return idOrderCreated;
        } catch (SQLException e) {
            System.out.println(e.getMessage() +"~~");
            System.out.println(s.toString() +"::");
        }
        return 0;
    }

    public boolean saveOrderDetail(int orderId, List<ProductInCheckout> listProductInCheckout) {
        PreparedStatement s=null;
        LocalDate today = java.time.LocalDate.now();
        try {
            String sql = "INSERT INTO `order_detail` (`idOrder`, `idShoe`, `size`, `color`, `quantity`) VALUES (?, ?, ?, ?, ?)";
            s = connect.prepareStatement(sql);
            for (ProductInCheckout productInCheckout : listProductInCheckout) {
                s.setInt(1, orderId);
                s.setString(2, productInCheckout.getIdProduct());
                s.setString(3, productInCheckout.getSize());
                s.setString(4, productInCheckout.getColor());
                s.setInt(5, productInCheckout.getQuantity());
                increaseSoleProduct(productInCheckout.getIdProduct());
                increaseSoleProductDetail(productInCheckout.getIdProduct(), productInCheckout.getColor(), productInCheckout.getSize());
                s.executeUpdate();
            }

            return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage() +"~~");
            System.out.println(s.toString() +"::");
        }
        return false;
    }

    private boolean increaseSoleProduct(String idProduct) {
        PreparedStatement s=null;
        try {
            String sql = "UPDATE product SET soleValue=soleValue-1 WHERE id=?";
            s = connect.prepareStatement(sql);
            s.setString(1, idProduct);
            s.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage() +"~~");
            System.out.println(s.toString() +"::");
        }
        return false;
    }

    // tăng số lượng sp đã bán và xóa sp đó khỏi cart
    private boolean increaseSoleProductDetail(String idProduct, String color, String  size) {
        PreparedStatement s=null;
        try {
            String sql = "UPDATE product_detail SET soleValue=soleValue-1 WHERE id=? AND size=? AND color=?";
            s = connect.prepareStatement(sql);
                s.setString(1, idProduct);
                s.setString(2, size);
                s.setString(3, color);

                ProductInCart productInCart = new ProductInCart("123", idProduct, color, Integer.parseInt(size));
                DaoCart.getInstance().deleteProductInCart(productInCart);
            s.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage() +"~~");
            System.out.println(s.toString() +"::");
        }
        return false;
    }
}
