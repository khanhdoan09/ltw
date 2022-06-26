package controller.product;

import beans.ProductHint;
import com.google.gson.Gson;
import dao.product.DaoProduct;
import dao.product.search.DaoSearchWithHint;
import service.customer.product.search.SearchWithHintService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchHintProductInHeader", value = "/SearchHintProductInHeader")
public class SearchHintProductInHeader extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String wordSearchHeader = request.getParameter("wordSearchHeader");
        if (wordSearchHeader != null) {
            response.setContentType("text/plain");
            response.setCharacterEncoding("UTF-8");
            SearchWithHintService searchWithHintService = new SearchWithHintService();
            String data = searchWithHintService.getData(wordSearchHeader);
            response.getWriter().write(data);
            return;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
