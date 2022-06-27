package controller.admin.product;
import dao.product.DaoProductAdmin;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DeleteProduct", value = "/DeleteProductAdmin")
public class DeleteProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String removeProductId = request.getParameter("removeProduct");
        boolean isDeleted = DaoProductAdmin.getInstance().deleteProductInAdmin(removeProductId, request);
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        if (isDeleted)
            response.getWriter().write("remove success");
        else
            response.getWriter().write("remove fail");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
