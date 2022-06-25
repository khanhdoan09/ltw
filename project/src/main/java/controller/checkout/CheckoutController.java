package controller.checkout;

import beans.ProductInCheckout;
import dao.checkout.DaoCheckout;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CheckoutController", value = "/CheckoutController")
public class CheckoutController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<ProductInCheckout> listProductInCheckout = (List<ProductInCheckout>) session.getAttribute("listProductInCheckout");
        double totalPrice = 0;
        for (ProductInCheckout productInCheckout : listProductInCheckout) {
            totalPrice += productInCheckout.getPrice();
        }
        // lưu order
        int orderId = DaoCheckout.getInstance().saveOrder("123", totalPrice);
        // lưu order detail
        DaoCheckout.getInstance().saveOrderDetail(orderId, listProductInCheckout);

        response.getWriter().write(listProductInCheckout.size()+"");
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
