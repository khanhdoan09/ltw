package controller.customer;

import com.google.gson.Gson;
import dao.user.DaoCustomer;
import beans.History;
import service.customer.personal.PersonalCustomerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "PurchaseHistoryController", value = "/PurchaseHistoryController")
public class PurchaseHistoryController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("userId");
        if(obj == null) {
            request.getRequestDispatcher("./views.customer/index.jsp").forward(request, response);
            return;
        }
        String idCustomer = (String) obj;
        PersonalCustomerService personalCustomerService = new PersonalCustomerService();

        List<History> purchaseHistory = personalCustomerService.getHistoryPurchase(idCustomer);
        String json = new Gson().toJson(purchaseHistory);
        System.out.println(json);

        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);

    }
}
