package controller.customer;

import model.User;
import model.customer.DaoCustomer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ChangeCustomerInfoController", value = "/changeCustomerInfoController")
public class ChangeCustomerInfoController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String gender = request.getParameter("gender");


        String idCustomer = "12";
        boolean isChanged = DaoCustomer.getInstance().updateInfo(idCustomer, name, email, phone, gender);
        if (isChanged) {
            User customer = DaoCustomer.getInstance().getUser(idCustomer);
            request.setAttribute("customer", customer);
            request.getRequestDispatcher("./views.customer/customer.jsp").forward(request, response);
        }
        else {

        }
    }
}
