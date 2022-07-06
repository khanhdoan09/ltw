package controller.customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

import dao.user.DaoCustomer;
import service.customer.personal.PersonalAddressService;
import service.customer.personal.PersonalCustomerService;

@WebServlet(name = "NewCustomerPassword", value = "/newCustomerPassword")
public class NewCustomerPassword extends HttpServlet {
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

        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        String oldPassword = request.getParameter("oldPassword");
        PersonalCustomerService personalCustomerService = new PersonalCustomerService();
        boolean isExistOldPassword = personalCustomerService.checkOldPasswordToChange(idCustomer, oldPassword);
        System.out.println(oldPassword);

        if (isExistOldPassword) {
            String newPassword = request.getParameter("newPassword");
            boolean isChangePassword = personalCustomerService.changePassword(idCustomer, newPassword);
            if (isChangePassword) {
                response.getWriter().write("success");
            }
            else {
                response.getWriter().write("fail");
            }
        }
        else {
            response.getWriter().write("wrong");
        }
    }
}
