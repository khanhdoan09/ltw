package controller.admin.voucher;

import dao.product.category.DaoVoucher;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet(name = "UpdateVoucher", value = "/UpdateVoucherAdmin")
public class UpdateVoucher extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id_voucher = request.getParameter("id_voucher");
        String from_date = request.getParameter("from_date");
        String to_date = request.getParameter("to_date");

        int discount = Integer.parseInt(request.getParameter("discount"));
        boolean re = DaoVoucher.getInstance().updateVoucher(id_voucher,from_date,to_date,discount);
        if (re) {
            response.getWriter().write("ok");
        }
        else {
            response.getWriter().write("error");
        }
        response.sendRedirect ("GetVoucherAdmin");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
