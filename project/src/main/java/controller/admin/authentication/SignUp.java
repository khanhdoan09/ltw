package controller.admin.authentication;

import model.Admin.DaoAuthentication;
import model.Admin.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Date;

@WebServlet(name = "SignUp", value = "/SignUp")
public class SignUp extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        String firstNameValidation = null;
        String lastNameValidation =  null;
        String emailValidation = null;
        String passwordValidation = null;
        String confirmValidation = null;

        if(firstName.isEmpty())
            firstNameValidation = " Must not be empty";
        if(lastName.isEmpty())
            lastNameValidation = " Must not be empty";
        if(email.isEmpty())
            emailValidation = " Must not be empty";
        if(password.isEmpty())
            passwordValidation = " Must not be empty";
        if(confirmPassword.isEmpty())
            confirmValidation = " Must not be empty";

        if (firstName.length() < 3) {
            firstNameValidation = " Length must be > " + 3;
        }
        if (lastName.length() < 3) {
            lastNameValidation = " Length must be > " + 3;
        }
        if (email.length() < 3) {
            emailValidation = " Length must be > " + 3;
        }
        if (password.length() < 3) {
            passwordValidation = " Length must be > " + 3;
        }
        if (confirmPassword.length() < 3) {
            confirmValidation = " Length must be > " + 3;
        }

        if (firstName.length() > 16) {
            firstNameValidation = " Length must be < " + 16;
        }
        if (lastName.length() > 16) {
            lastNameValidation = " Length must be < " + 16;
        }
        if (email.length() > 50) {
            emailValidation = " Length must be < " + 50;
        }
        if (password.length() > 16) {
            passwordValidation = " Length must be < " + 16;
        }
        if (confirmPassword.length() > 16) {
            confirmValidation = " Length must be < " + 16;
        }

        if (!password.equals(confirmPassword)){
            confirmValidation = "password is not match";
        }

        boolean checkEmailExisted = DaoAuthentication.getInstance().checkEmailExisted(email);
        System.out.println(checkEmailExisted);
        if(!checkEmailExisted) {
            emailValidation = "Email is existed";
        }

        System.out.println(firstNameValidation + "1"+lastNameValidation+"2"+emailValidation+"3"+passwordValidation+"5"+confirmValidation);
        if (firstNameValidation == null
                && lastNameValidation == null
                && emailValidation == null
                && passwordValidation == null
                && confirmValidation ==null) {
            User user = new User("",
                    firstName+" "+lastName,
                    email,
                    null,
                    null,
                    null,
                    null,
                    1,
                    new Date().toString(),
                    null,
                    null,
                    null,
                    password);
            DaoAuthentication.getInstance().saveUser(user);
        }


        request.setAttribute("firstNameValidation", firstNameValidation);
        request.setAttribute("lastNameValidation", lastNameValidation);
        request.setAttribute("emailValidation", emailValidation);
        request.setAttribute("passwordValidation", passwordValidation);
        request.setAttribute("confirmPassword", confirmValidation);
        request.getRequestDispatcher("/views/admin/signUp/signUp.jsp").forward(request, response);
    }


    private void checkLengthTooLong(String type, String validation, int length) {
        if (type.length() > length) {
            validation = new String("length must be < " + length);
        }
    }

}
