package controller.cart;

import beans.Cart;
import dao.cart.DaoCart;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DeleteProductInCart", value = "/DeleteProductInCart")
public class DeleteProductInCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idProduct = request.getParameter("idProduct");
        String idCustomer = request.getParameter("idCustomer");
        Cart cart = new Cart(idCustomer, idProduct);
        DaoCart.getInstance().deleteProductInCart(cart);

        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("ok");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
