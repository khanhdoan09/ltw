package controller.admin;

import model.Admin.DaoUserAdmin;
import model.Admin.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ListUser", value = "/ListUser")
public class ListUser extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> users = DaoUserAdmin.getInstance().getListUser();
        request.setAttribute("users", users);
        request.getRequestDispatcher("customer-admin.jsp").forward(request, response);
    }
}
