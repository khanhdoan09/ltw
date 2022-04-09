package controller.admin;

import model.Admin.DaoOrderAdmin;
import model.Admin.OrderDetail;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ListOrderDetail", value = "/ListOrderDetail")

public class ListOrderDetail extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("idOrder");
        System.out.println(id);
        List<OrderDetail> orderDetails = DaoOrderAdmin.getInstance().getListOrderDetail(id);
        System.out.println(orderDetails.size());
        request.setAttribute("orderDetails", orderDetails);
        request.getRequestDispatcher("views/admin/crud/order/order-detail.jsp").forward(request, response);
    }
}
