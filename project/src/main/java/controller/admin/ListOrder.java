package controller.admin;

import dao.product.order.DaoOrderAdmin;
import model.Admin.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ListOrder", value = "/ListOrder")
public class ListOrder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Order> orders = DaoOrderAdmin.getInstance().getListOrder();
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("/views/admin/crud/order/order.jsp").forward(request, response);
    }
}
