package controller.admin.voucher;

import dao.product.category.DaoVoucher;
import beans.Voucher;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "GetVoucher", value = "/GetVoucherAdmin")
public class GetVoucher extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Voucher> voucher = DaoVoucher.getInstance().getListVoucher();
        request.setAttribute ("voucher", voucher);
        request.getRequestDispatcher("/views/admin/crud/voucher/voucher.jsp").forward (request,response);
    }
}
