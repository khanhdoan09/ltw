package controller.admin;

import model.Admin.DaoProductAdmin;
import model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "RemoveDetail", value = "/RemoveDetail")
public class RemoveDetail extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String color = request.getParameter("color");
        int size = Integer.parseInt(request.getParameter("size"));
        boolean check  = DaoProductAdmin.getInstance().deleteDetailProductInAdmin(id, size, color);
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        if (check)
        response.getWriter().write("ok");
        else
            response.getWriter().write("err");
    }
}
