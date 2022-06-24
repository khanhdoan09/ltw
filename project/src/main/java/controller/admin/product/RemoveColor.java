package controller.admin.product;

import dao.product.color.DaoProductColor;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
        boolean check = DaoProductColor.getInstance().removeColor(id, color);
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        if (check)
            response.getWriter().write("ok");
        else
            response.getWriter().write("err");
    }
}
