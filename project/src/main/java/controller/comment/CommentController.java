package controller.comment;

import beans.Comment;
import dao.comment.DaoComment;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Date;

@WebServlet(name = "CommentController", value = "/CommentController")
public class CommentController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String idComment = request.getParameter("idComment");

        String idProduct = request.getParameter("idProduct");
//        int amount = DaoComment.getInstance().getAmountComment(idProduct) +1;
//        String idComment = "CM" + amount;
        System.out.println("run me");
        String content = request.getParameter("contentComment").trim();
        String idUser = request.getParameter("idUser");
        String dateComment = request.getParameter("dateComment");;
        Date d = new Date();
        System.out.println("jdk comment "+content);
        Comment comment = new Comment(idProduct,content,idUser,dateComment);

        DaoComment.getInstance().createNewComment(comment);
        HttpSession session = request.getSession(true);
    }
}
