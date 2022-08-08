package controller.product;

import dao.comment.DaoComment;
import dao.product.DaoProduct;
import beans.Product;
import beans.Comment;
import service.customer.product.detail.DetailService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductDetail", value = "/ProductDetail")
public class ProductDetail extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idProduct = request.getParameter("idProduct");


        List<Comment> listComment = DaoComment.getInstance().getListComment(idProduct);
        request.setAttribute("listComment", listComment);
        System.out.println("comment");
        for (Comment c :
                listComment) {
            System.out.println("comment "+c.getIdComment() + c.getId_reply());
        }


        DetailService detailService = new DetailService();
        request.setAttribute("product", detailService.getDetail(idProduct));
        request.setAttribute("listHotProduct", detailService.getListHotProduct(idProduct));

        // product was watched
        HttpSession session = request.getSession(true);
        ArrayList<String> listProductWatched = (ArrayList<String>) session.getAttribute("listProductWatched");
        if (listProductWatched == null) {
            listProductWatched = new ArrayList<String>();
            session.setAttribute("listProductWatched", listProductWatched);
        }
        if (!listProductWatched.contains(idProduct)) {
            listProductWatched.add(idProduct);
        }

        request.setAttribute("idProduct", idProduct);
        request.getRequestDispatcher("views.customer/product.jsp").forward(request, response);
    }
}