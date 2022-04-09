package controller.admin.authentication;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Route", value = "/Route")
public class Route extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page = request.getParameter("page");
        if (page.equals("listProduct")) {
            request.getRequestDispatcher("/views/admin/crud/product/order-invoices.jsp").forward(request, response);
        }
        else if (page.equals("customer")) {
            request.getRequestDispatcher("/views/admin/crud/customer/customer-admin.jsp").forward(request, response);
        }
        else if (page.equals("order")) {
            request.getRequestDispatcher("/views/admin/crud/order/order.jsp").forward(request, response);
        }
        else if (page.equals("orderDetail")) {
            String idOrder = request.getParameter("idOrder");
            System.out.println(idOrder);
            request.getRequestDispatcher("/ListOrderDetail??idOrder="+idOrder).forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       // login dung form
        doGet(request, response);
    }
}
