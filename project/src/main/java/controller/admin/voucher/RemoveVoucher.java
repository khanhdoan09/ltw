package controller.admin.voucher;

import dao.product.category.DaoVoucher;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "RemoveVoucher", value = "/RemoveVoucherAdmin")
public class RemoveVoucher extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idVoucher = request.getParameter("id");

        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        boolean re = DaoVoucher.getInstance().removeVoucher(idVoucher);
        if (re) {
            response.getWriter().write("ok");
        }
        else {
            response.getWriter().write("error");
        }
    }
}
