package controller.product;

import dao.product.DaoProduct;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Active", value = "/Active")
public class Active extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        String id = request.getParameter("idProduct");
        boolean isActive = DaoProduct.getInstance().checkActive(id);
        if (isActive) {
            response.getWriter().write("ok");
        }
        else {
            response.getWriter().write("error");
        }
    }
}
