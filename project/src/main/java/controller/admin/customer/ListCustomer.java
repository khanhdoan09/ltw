package controller.admin.customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import dao.user.DaoUserAdmin;
import beans.User;


@WebServlet(name = "ListCustomer", value = "/ListCustomerAdmin")
public class ListCustomer extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> users = DaoUserAdmin.getInstance().getListUser();
        request.setAttribute("users", users);
        request.getRequestDispatcher("/views/admin/crud/customer/customer-admin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
