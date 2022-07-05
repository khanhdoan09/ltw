package controller.admin.order;

import dao.order.DaoOrderAdmin;
import beans.OrderDetailInAdmin;
import service.admin.OrderAdminService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ListOrderDetail", value = "/ListOrderDetailAdmin")

public class ListOrderDetail extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("idOrder");
        OrderAdminService orderAdminService = new OrderAdminService();

        List<OrderDetailInAdmin> orderDetails = orderAdminService.getListOrderDetail(id);
        request.setAttribute("orderDetails", orderDetails);
        request.getRequestDispatcher("views/admin/crud/order/order-detail.jsp").forward(request, response);
    }
}
