package controller.admin.home;

import dao.homeAdmin.DaoHome;
import beans.HomeAdmin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "HomeController", value = "/HomeControllerAdmin")
public class HomeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int countUser = DaoHome.getInstance().getCountUser();
        int countOrder = DaoHome.getInstance().getOrder();
        int turnover = DaoHome.getInstance().getTurnover();
        int quantityProduct = DaoHome.getInstance().getQuantityProduct();
        int qPDetail = DaoHome.getInstance().getQuantityProductDetail();
        int countOrderOk = DaoHome.getInstance().getCountOrders();
        int sumPrice = DaoHome.getInstance().getSumPrice();;
        int countProductSale = DaoHome.getInstance().getCountProductSale();
        int countBrand = DaoHome.getInstance().getCountBrand();
        int countComment = DaoHome.getInstance().getCountComment();
        int countCategory = DaoHome.getInstance().getCountCategory();

        HomeAdmin homeAdmin = new HomeAdmin(countUser,countOrder,turnover,quantityProduct,qPDetail,countOrderOk,sumPrice,countProductSale,countBrand,countComment, countCategory);
        request.setAttribute("homeAdmin", homeAdmin);
        System.out.println(homeAdmin.getCountUser());
        request.getRequestDispatcher("/views/admin/crud/home/home.jsp").forward (request,response);

    }
}
