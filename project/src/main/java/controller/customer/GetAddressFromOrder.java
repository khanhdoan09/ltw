package controller.customer;

import dao.user.DaoCustomerAddress;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "GetAddressFromOrder", value = "/GetAddressFromOrder")
public class GetAddressFromOrder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        String order = request.getParameter("order");
        response.getWriter().write(DaoCustomerAddress.getInstance().getAddressFromOrder(order));
    }
}
