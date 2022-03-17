package controller.admin;

import model.Admin.DaoProductAdmin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "RemoveColor", value = "/RemoveColor")
public class RemoveColor extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String color = request.getParameter("color");
        System.out.println(id + " " + color);
        boolean check = DaoProductAdmin.getInstance().removeColor(id, color);
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        if (check)
            response.getWriter().write("ok");
        else
            response.getWriter().write("err");
    }
}
