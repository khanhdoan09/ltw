package controller.cart;

import dao.cart.DaoCart;
import beans.Cart;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "GetProductInCart", value = "/GetProductInCart")
public class GetProductInCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("userId");
        String idCustomer = obj.toString();
        List<Cart> listCart = DaoCart.getInstance().getListProductInCart(idCustomer);
        request.setAttribute("listProductInCart", listCart);
        request.getRequestDispatcher("views.customer/cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
