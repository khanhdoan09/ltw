package controller.admin.voucher;

import beans.Voucher;
import dao.product.category.DaoVoucher;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AddVoucher", value = "/AddVoucherAdmin")
public class AddVoucher extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String from_date = request.getParameter("fromDate");
        String to_date = request.getParameter("toDate");
        int discount = Integer.parseInt(request.getParameter("discount"));
        DaoVoucher.getInstance().addVoucher(from_date, to_date,discount);
        response.sendRedirect ("GetVoucherAdmin");
    }
}
