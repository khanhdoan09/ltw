package controller.customer;

import beans.User;
import dao.user.DaoCustomer;
import service.customer.personal.PersonalCustomerService;

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
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("userId");
        if(obj == null) {
            request.getRequestDispatcher("./views.customer/index.jsp").forward(request, response);
            return;
        }
        String idCustomer = (String) obj;
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String gender = request.getParameter("gender");
        String day = request.getParameter("day");
        String month = request.getParameter("month");
        String year = request.getParameter("year");
        String dob = day+"/"+month+"/"+year+"";
        PersonalCustomerService personalCustomerService = new PersonalCustomerService();
        boolean isChanged = personalCustomerService.updateInfo(idCustomer, name, email, phone, gender, dob);
        if (isChanged) {
            User customer = personalCustomerService.getUser(idCustomer);
            request.setAttribute("customer", customer);
            request.getRequestDispatcher("customer").forward(request, response);
        }
    }
}
