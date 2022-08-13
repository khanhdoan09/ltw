package dao.checkout;

import beans.Voucher;
import beans.Checkout;
import beans.Cart;
import database.DatabaseConnection;
import dao.cart.DaoCart;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
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

    public int saveOrder(String idCustomer, double totalPrice, String idAddress) {
        PreparedStatement s=null;
        LocalDate today = java.time.LocalDate.now();
        try {
            String sql = "INSERT INTO `orders` (`customer`, `total_price`, `create_at`, `idAddress`, `status`) VALUES (?, ?, ?, ?, ?)";
            s = connect.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            s.setString(1, idCustomer);
            s.setDouble(2, totalPrice);
            s.setString(3, today.toString());
            s.setString(4, idAddress);
            s.setString(5, "đang giao");
            s.executeUpdate();

            // lấy id order được tự động tạo ra sau khi insert
            ResultSet rs = s.getGeneratedKeys();
            rs.next();
            int idOrderCreated = rs.getInt(1);
            return idOrderCreated;
        } catch (SQLException e) {
            System.out.println("~~"+e.getMessage());
        }
        return 0;
    }

    public String checkAmountInStore(List<Checkout> listCheckout) {
        String re = null;
        PreparedStatement s=null;
        LocalDate today = java.time.LocalDate.now();
        try {
            String sql = "select * from product_detail inner join product on product_detail.id=product.id where product_detail.idDetail=?";
            s = connect.prepareStatement(sql);
            for (Checkout checkout : listCheckout) {
                s.setString(1, checkout.getIdProductDetail());
                ResultSet rs = s.executeQuery();
                while (rs.next()) {
                    String name = rs.getString("name");
                    int size = rs.getInt("size");
                    String color = rs.getString("color");
                    int totalValue = rs.getInt("totalValue");
                    int soleValue = rs.getInt("soleValue");
                    System.out.println(totalValue - soleValue +"~"+checkout.getQuantity());
                    if ((totalValue - soleValue) < checkout.getQuantity()) {
                        re = "rất tiếc sản phẩm: "+name+ ", size: " + size + ", màu: "+ color + " với "+ checkout.getQuantity() +" số lượng không đủ để bán";
                        return re;
                    }
                }
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return re;
    }

    public boolean saveOrderDetail(String idUser, int orderId, List<Checkout> listCheckout) {
        PreparedStatement s=null;
        LocalDate today = java.time.LocalDate.now();
        try {
            String sql = "INSERT INTO `order_detail` (`idOrder`, `idProductDetail`, `quantity`) VALUES (?, ?, ?)";
            s = connect.prepareStatement(sql);
            for (Checkout checkout : listCheckout) {
                s.setInt(1, orderId);
                s.setString(2, checkout.getIdProductDetail());
                s.setInt(3, checkout.getQuantity());
                increaseSoleProduct(checkout.getIdProduct());
                increaseSoleProductDetail(idUser, checkout.getIdProductDetail());
                s.executeUpdate();
            }

            return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
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
            System.out.println(e.getMessage());
        }
        return false;
    }

    // tăng số lượng sp đã bán và xóa sp đó khỏi cart
    private boolean increaseSoleProductDetail(String idUser, String idProductDetail) {
        PreparedStatement s=null;
        try {
            String sql = "UPDATE product_detail SET soleValue=soleValue-1 WHERE idDetail=?";
            s = connect.prepareStatement(sql);
                s.setString(1, idProductDetail);
                Cart cart = new Cart(idUser, idProductDetail);
                DaoCart.getInstance().deleteProductInCart(cart);
            s.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return false;
    }

    public Voucher getDiscountVoucher(String codeVoucher) {
        PreparedStatement s = null;
        String sql = "SELECT * FROM voucher WHERE code=?";
        try {
            s = connect.prepareStatement(sql);
            s.setString(1, codeVoucher);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                Voucher voucher = new Voucher(rs.getString("id"), rs.getString("from_date"), rs.getString("to_date"),rs.getInt("discount"), rs.getString("code"), rs.getInt("used"));
                return voucher;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public boolean setVoucherUsed(String codeVoucher) {
        PreparedStatement s=null;
        try {
            String sql = "UPDATE voucher SET used=1 WHERE code=?";
            s = connect.prepareStatement(sql);
            s.setString(1, codeVoucher);
            s.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return false;
    }
}
