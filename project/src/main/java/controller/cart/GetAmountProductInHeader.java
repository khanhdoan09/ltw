package controller.cart;

import dao.cart.DaoCart;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "GetAmountProductInHeader", value = "/GetAmountProductInHeader")
public class GetAmountProductInHeader extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idCustomer = "123";
        int productAmount = DaoCart.getInstance().getProductAmountInCart(idCustomer);

        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(Integer.toString(productAmount));
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}