package controller.checkout;

import beans.Checkout;
import dao.checkout.DaoCheckout;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CheckoutController", value = "/CheckoutController")
public class CheckoutController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("userId");
        String idUser = obj.toString();
        String idAddress = request.getParameter("idAddress");
        List<Checkout> listCheckout = (List<Checkout>) session.getAttribute("listProductInCheckout");
        double totalPrice = 0;
        for (Checkout checkout : listCheckout) {
            totalPrice += checkout.getPrice();
        }
        // lưu order
        int orderId = DaoCheckout.getInstance().saveOrder(idUser, totalPrice, idAddress);
        // lưu order detail
        DaoCheckout.getInstance().saveOrderDetail(idUser, orderId, listCheckout);

        response.getWriter().write(listCheckout.size()+"");
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
