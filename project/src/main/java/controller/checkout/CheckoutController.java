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
        String codeVoucher = request.getParameter("codeVoucher");
        String price = request.getParameter("price");
        List<Checkout> listCheckout = (List<Checkout>) session.getAttribute("listProductInCheckout");
        double totalPrice = Double.parseDouble(price);
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        String reCheckAmount = DaoCheckout.getInstance().checkAmountInStore(listCheckout);
        // hết số lượng
        System.out.println(reCheckAmount);
        if(reCheckAmount != null) {
            response.getWriter().write(reCheckAmount);
            return;
        }
        else {
            // lưu order
            int orderId = DaoCheckout.getInstance().saveOrder(idUser, totalPrice, idAddress);
            // lưu order detail
            DaoCheckout.getInstance().saveOrderDetail(idUser, orderId, listCheckout);
            // set voucher đã sử dụng
            DaoCheckout.getInstance().setVoucherUsed(codeVoucher);

            response.getWriter().write(listCheckout.size()+"");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
