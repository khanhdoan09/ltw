package controller.admin;

import model.Admin.DaoUserAdmin;
import model.Admin.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
