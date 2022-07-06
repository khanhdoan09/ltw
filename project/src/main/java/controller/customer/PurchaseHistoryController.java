package controller.customer;

import com.google.gson.Gson;
import dao.user.DaoCustomer;
import beans.History;
import service.customer.personal.PersonalAddressService;

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
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("userId");
        if(obj != null) {
            request.getRequestDispatcher("./views.customer/index.jsp").forward(request, response);
            return;
        }
        String idCustomer = (String) obj;
        PersonalAddressService personalAddressService = new PersonalAddressService();

        List<History> purchaseHistory = personalAddressService.getHistoryPurchase(idCustomer);
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
