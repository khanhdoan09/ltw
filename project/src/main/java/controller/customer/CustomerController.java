package controller.customer;

import beans.User;
import dao.user.DaoCustomer;
import service.customer.personal.PersonalCustomerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CustomerController", value = "/customer")
public class CustomerController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("userId");
        if(obj != null) {
            String idCustomer = (String) obj;
            PersonalCustomerService personalCustomerService = new PersonalCustomerService();
            User customer = personalCustomerService.getUser(idCustomer);
            if (customer.getGender() ==null){
                customer.setGender("null");
            }
            request.setAttribute("customer", customer);
            request.getRequestDispatcher("./views.customer/customer.jsp").forward(request, response);
        }
        else {
            request.getRequestDispatcher("./views.customer/index.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
