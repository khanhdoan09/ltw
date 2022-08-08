package controller.admin.product.create;

import beans.ProductDetail;
import dao.product.detail.DaoProductDetail;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AddDetail", value = "/AddDetailAdmin")
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

        boolean check = DaoProductDetail.getInstance().addDetailProductInAdmin(id, new ProductDetail(color, size, total, sole));

        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        if (check)
            response.getWriter().write("ok");
        else
            response.getWriter().write("err");

    }
}
