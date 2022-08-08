package controller.admin.comment;
import dao.comment.DaoComment;
import  beans.Comment;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Date;

@WebServlet(name = "ReplyComment", value = "/ReplyComment")
public class ReplyComment extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idReply = request.getParameter("id");
        String content = request.getParameter("content");
        String idProduct = request.getParameter("product");
        Date d = new Date();
        String dateComment = d.toString();
        System.out.println("id_reply" + idReply);
        String idAdmin = (String) request.getSession().getAttribute("idAdmin");
        Comment comment = new Comment();
        comment.setIdProduct(idProduct);
        comment.setContent(content);
        comment.setDateComment(dateComment);
        comment.setId_reply(idReply);
        comment.setIdUser(idAdmin);

        System.out.println(comment.getId_reply());
        DaoComment.getInstance().replyComment(comment);

        request.getRequestDispatcher("GetComment").forward(request, response);
    }
}
