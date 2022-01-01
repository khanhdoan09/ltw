package controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.xml.ws.http.HTTPBinding;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ProductDetail", value = "/ProductDetail")
public class ProductDetail extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idProduct = request.getParameter("idProduct");
        request.setAttribute("idProduct", idProduct);
        request.getRequestDispatcher("product.jsp").forward(request, response);

        // product was watched
        HttpSession session = request.getSession(true);
        ArrayList<String> listProductWatched = (ArrayList<String>) session.getAttribute("listProductWatched");
        if (listProductWatched == null) {
            listProductWatched = new ArrayList<String>();
            session.setAttribute("listProductWatched", listProductWatched);
        }
        listProductWatched.add(idProduct);
    }
}