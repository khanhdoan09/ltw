package controller.admin;

import model.Admin.DaoProductAdmin;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
        boolean check = DaoProductAdmin.getInstance().deleteImg(request, id, nameImg);
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        if (check)
        response.getWriter().write("ok");
        else
            response.getWriter().write("err");
    }
}
