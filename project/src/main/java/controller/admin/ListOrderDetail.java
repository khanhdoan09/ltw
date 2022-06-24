package controller.admin;

import dao.product.order.DaoOrderAdmin;
import model.Admin.OrderDetail;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
        System.out.println(123456789);
        String id = request.getParameter("idOrder");
        System.out.println(id);
        List<OrderDetail> orderDetails = DaoOrderAdmin.getInstance().getListOrderDetail(id);
        System.out.println(orderDetails.size());
        request.setAttribute("orderDetails", orderDetails);
        request.getRequestDispatcher("views/admin/crud/order/order-detail.jsp").forward(request, response);
    }
}
