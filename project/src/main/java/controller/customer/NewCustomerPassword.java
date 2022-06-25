package controller.customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

import model.customer.DaoCustomer;

@WebServlet(name = "NewCustomerPassword", value = "/newCustomerPassword")
public class NewCustomerPassword extends HttpServlet {
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
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        String customerId = "12";
        String oldPassword = request.getParameter("oldPassword");
        boolean isExistOldPassowrd = DaoCustomer.getInstance().checkOldPasswordToChange(customerId, oldPassword);
        System.out.println(oldPassword);

        if (isExistOldPassowrd) {
            String newPassword = request.getParameter("newPassword");
            boolean isChangePassword = DaoCustomer.getInstance().changePassword(customerId, newPassword);
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
