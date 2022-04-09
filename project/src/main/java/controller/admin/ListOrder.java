package controller.admin;

import model.Admin.DaoOrderAdmin;
import model.Admin.Order;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
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
