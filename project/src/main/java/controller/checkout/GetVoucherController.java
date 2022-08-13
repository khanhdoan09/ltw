package controller.checkout;

import com.google.gson.Gson;
import dao.checkout.DaoCheckout;
import beans.Voucher;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "GetVoucherController", value = "/GetVoucherController")
public class GetVoucherController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("idVoucher");
        Voucher voucher = DaoCheckout.getInstance().getDiscountVoucher(id);
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        String voucherJson = new Gson().toJson(voucher);
        response.getWriter().write(voucherJson);
    }
}
