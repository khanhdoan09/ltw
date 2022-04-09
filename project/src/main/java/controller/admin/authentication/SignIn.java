package controller.admin.authentication;

import model.Admin.DaoAuthentication;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "SignIn", value = "/SignIn")
public class SignIn extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String emailValidation = null;
        String passwordValidation = null;

        boolean emailExisted = DaoAuthentication.getInstance().checkEmailExisted(email);
        if (emailExisted) {
            emailValidation = " Email not exist ";
        }
        if (email.isEmpty()) {
            emailValidation = " Email must be not empty";
        }
        if (password.isEmpty()) {
            passwordValidation = " Password must be not empty";
        }
        if(emailValidation==null && passwordValidation == null) {
            if(DaoAuthentication.getInstance().checkPassword(password)==false) {
                request.getSession(true).setAttribute("user", true);
                request.getRequestDispatcher("/Route?page=listProduct").forward(request, response);
//                request.getRequestDispatcher("/views/admin/crud/product/order-invoices.jsp").forward(request, response);
                return;
            }
        }
        request.setAttribute("emailValidation", emailValidation);
        request.setAttribute("passwordValidation", passwordValidation);
        request.getRequestDispatcher("/views/admin/authentication/signIn/signIn.jsp").forward(request, response);
    }
}
