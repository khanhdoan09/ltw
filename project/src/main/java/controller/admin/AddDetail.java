package controller.admin;

import model.Admin.DaoProductAdmin;
import model.ProductDetail;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AddDetail", value = "/AddDetail")
public class AddDetail extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String color = request.getParameter("color");
        int size = Integer.parseInt(request.getParameter("size"));
        int total = Integer.parseInt(request.getParameter("total"));
        int sole =  Integer.parseInt(request.getParameter("sole"));

        boolean check = DaoProductAdmin.getInstance().addDetailProductInAdmin(id, new ProductDetail(color, size, total, sole));

        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        if (check)
            response.getWriter().write("ok");
        else
            response.getWriter().write("err");

    }
}
