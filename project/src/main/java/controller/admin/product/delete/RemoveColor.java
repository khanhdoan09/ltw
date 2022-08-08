package controller.admin.product.delete;

import dao.product.color.DaoProductColor;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "RemoveColor", value = "/RemoveColor")
public class RemoveColor extends HttpServlet {
    // xoa mau trong product detail in admin
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String color = request.getParameter("color");
        System.out.println(id + " " + color);
        String appPath = getServletContext().getRealPath("") + "upload\\product";;
        boolean check = DaoProductColor.getInstance().removeColor(id, color, appPath);
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        if (check)
            response.getWriter().write("ok");
        else
            response.getWriter().write("err");
    }
}
