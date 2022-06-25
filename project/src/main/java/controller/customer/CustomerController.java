package controller.customer;

import beans.User;
import model.customer.DaoCustomer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CustomerController", value = "/customer")
public class CustomerController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        boolean isLogin = request.getSession(true).getAttribute("user") != null ? true : false;
//        if (isLogin) {
//            String idCustomer = (String) request.getSession().getAttribute("idCustomer");
//        }
//        else {
//
//        }
        String idCustomer = "12";
        User customer = DaoCustomer.getInstance().getUser(idCustomer);
        if (customer.getGender() ==null){
            customer.setGender("null");
        }
        request.setAttribute("customer", customer);
        request.getRequestDispatcher("./views.customer/customer.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
