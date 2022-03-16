package controller.admin;

import model.Admin.DaoProductAdmin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "RemoveImg", value = "/RemoveImg")
public class RemoveImg extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String nameImg = request.getParameter("nameImg");
        boolean check = DaoProductAdmin.getInstance().deleteImg(id, nameImg);
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        if (check)
        response.getWriter().write("ok");
        else
            response.getWriter().write("err");
    }
}
