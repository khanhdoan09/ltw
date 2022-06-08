package controller.customer;

import com.google.gson.Gson;
import model.customer.DaoCustomer;
import beans.History;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "PurchaseHistoryController", value = "/purchaseHistory")
public class PurchaseHistoryController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //        boolean isLogin = request.getSession(true).getAttribute("user") != null ? true : false;
//        if (isLogin) {
//            String idCustomer = (String) request.getSession().getAttribute("idCustomer");
//        }
//        else {
//
//        }
        String customerId = "12";
        List<History> purchaseHistory = DaoCustomer.getInstance().getHistoryPurchase(customerId);
        String json = new Gson().toJson(purchaseHistory);

        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);



//        request.setAttribute("purchaseHistory", purchaseHistory);
//        User customer = DaoCustomer.getInstance().getUser(customerId);
//        if (customer.getGender() ==null){
//            customer.setGender("null");
//        }
//        request.setAttribute("customer", customer);
//        request.getRequestDispatcher("./views.customer/customer.jsp").forward(request, response);
    }
}
