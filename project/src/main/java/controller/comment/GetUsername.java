package controller.comment;

import dao.comment.DaoComment;
import dao.product.DaoProduct;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "GetUsername", value = "/GetUsername")
public class GetUsername extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idUser = request.getParameter("idUser");
        String name = DaoComment.getInstance().getNameUser(idUser);
        response.getWriter().println(name);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
