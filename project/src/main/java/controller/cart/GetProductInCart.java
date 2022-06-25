package controller.cart;

import dao.cart.DaoCart;
import beans.ProductInCart;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "GetProductInCart", value = "/GetProductInCart")
public class GetProductInCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<ProductInCart> listProductInCart = DaoCart.getInstance().getListProductInCart("123");

        request.setAttribute("listProductInCart", listProductInCart);
        request.getRequestDispatcher("views.customer/cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
