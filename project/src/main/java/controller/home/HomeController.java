package controller.home;

import service.customer.product.home.HomeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "HomeController", value = "/home")
public class HomeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HomeService homeService = new HomeService();
        request.setAttribute("listNewestProduct", homeService.getListNewestProduct());
        request.setAttribute("listBestSaleProduct", homeService.getBestSaleProduct());
        request.setAttribute("listBestSellerProduct", homeService.getBestSaleProduct());
        request.getRequestDispatcher("./views.customer/index.jsp").forward(request, response);
    }
}
