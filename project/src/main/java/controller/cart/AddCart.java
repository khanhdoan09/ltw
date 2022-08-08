package controller.cart;

import beans.Cart;
import dao.cart.DaoCart;
import dao.product.detail.DaoProductDetail;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CartCustomerController", value = "/addCart")
public class AddCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // lấy id customer
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("userId");
        if (obj == null) {
            return;
        }
        String idProduct = request.getParameter("idProduct");
        String idCustomer = obj.toString();
        int quantityShoe = Integer.parseInt(request.getParameter("quantity"));
        int sizeShoe = Integer.parseInt(request.getParameter("size"));
        String colorShoe = request.getParameter("color");
        double productPrice = Double.parseDouble(request.getParameter("productPrice"));

        // lấy id product detail
        String idProductDetail = DaoProductDetail.getInstance().getIdProductDetail(idProduct, colorShoe, sizeShoe);

        // thêm product detail vào cart
        Cart cart = new Cart(idCustomer, idProductDetail, quantityShoe);
        DaoCart.getInstance().insertShoeToCart(cart);

        // lấy danh sách product trong cart
        List<Cart> listCart = DaoCart.getInstance().getListProductInCart(idCustomer);

        request.setAttribute("idCustomer", idCustomer);
        request.setAttribute("listProductInCart", listCart);
        request.setAttribute("cart", cart);
        request.getRequestDispatcher("views.customer/cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
