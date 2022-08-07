package controller.admin.comment;

import dao.comment.DaoComment;
import  beans.Comment;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "GetComment", value = "/GetComment")
public class GetComment extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<beans.Comment> list = new ArrayList<Comment>();
        list = DaoComment.getInstance().getListComment();
        request.setAttribute("listComment", list);
        request.getRequestDispatcher("/views/admin/crud/comment/comment.jsp").forward(request, response);
    }
}
