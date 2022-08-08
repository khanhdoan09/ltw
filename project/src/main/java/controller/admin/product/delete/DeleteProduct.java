package controller.admin.product.delete;
import dao.product.DaoProductAdmin;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DeleteProduct", value = "/DeleteProductAdmin")
public class DeleteProduct extends HttpServlet {
    private static final String SAVE_DIR = "upload\\product";

    // delete product in listproduct.jsp
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String appPath = getServletContext().getRealPath("") + SAVE_DIR;

        String removeProductId = request.getParameter("removeProduct");
        boolean isDeleted = DaoProductAdmin.getInstance().deleteProductInAdmin(removeProductId, appPath);
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
