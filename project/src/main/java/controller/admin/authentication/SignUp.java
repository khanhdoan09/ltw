package controller.admin.authentication;

import controller.admin.authentication.api.ConstantSignUp;
import controller.admin.authentication.api.GoogleItem;
import controller.admin.authentication.api.GooglePojo;
import dao.user.DaoAuthentication;
import beans.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet(name = "SignUp", value = "/SignUpInAuthentication")
public class SignUp extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("code");
        if (code != null) {
            String accessToken = GoogleItem.getToken(code, ConstantSignUp.GOOGLE_LINK_GET_TOKEN, ConstantSignUp.GOOGLE_CLIENT_ID, ConstantSignUp.GOOGLE_CLIENT_SECRET, ConstantSignUp.GOOGLE_REDIRECT_URI, ConstantSignUp.GOOGLE_GRANT_TYPE);
            GooglePojo googlePojo = GoogleItem.getUserInfo(accessToken);
            request.setAttribute("id", googlePojo.getId());
            request.setAttribute("name", googlePojo.getName());
            request.setAttribute("email", googlePojo.getEmail());
            System.out.println(googlePojo.getId() + " " + googlePojo.getName() + " " + googlePojo.getEmail());
            if (DaoAuthentication.getInstance().checkPassword(googlePojo.getId()) == true) {
                User user = new User("",
                        googlePojo.getName(),
                        googlePojo.getEmail(),
                        null,
                        null,
                        null,
                        null,
                        1,
                        new Date().toString(),
                        null,
                        null,
                        null,
                        googlePojo.getId());
                DaoAuthentication.getInstance().saveUser(user);
                request.getSession(true).setAttribute("user", true);
                request.getRequestDispatcher("HomeControllerAdmin").forward(request, response);
                return;
            }
            request.getRequestDispatcher("/views/admin/authentication/signIn/signInAdmin.jsp").forward(request, response);
            return;
        } else {
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String confirmPassword = request.getParameter("confirmPassword");

            String firstNameValidation = null;
            String lastNameValidation = null;
            String emailValidation = null;
            String passwordValidation = null;
            String confirmValidation = null;

            if (firstName.isEmpty())
                firstNameValidation = " Must not be empty";
            if (lastName.isEmpty())
                lastNameValidation = " Must not be empty";
            if (email.isEmpty())
                emailValidation = " Must not be empty";
            else  {
                Pattern regexPattern = Pattern.compile("^.+@.+\\..+$");
                Matcher regMatcher = regexPattern.matcher(email);
                if(!regMatcher.matches()) {
                    emailValidation = " Type email not correct";
                }
            }
            if (password.isEmpty())
                passwordValidation = " Must not be empty";
            if (confirmPassword.isEmpty())
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
            if (password.length() < 10) {
                passwordValidation = " Length must be > 10";
            }
            if (confirmPassword.length() < 10) {
                confirmValidation = " Length must be > 10";
            }

            if (firstName.length() > 16) {
                firstNameValidation = " Length must be < 16";
            }
            if (lastName.length() > 16) {
                lastNameValidation = " Length must be < 16";
            }
            if (email.length() > 50) {
                emailValidation = " Length must be < 50";
            }
            if (password.length() > 16) {
                passwordValidation = " Length must be < 16";
            }
            if (confirmPassword.length() > 16) {
                confirmValidation = " Length must be < 16";
            }

            if (!password.equals(confirmPassword)) {
                confirmValidation = "password is not match";
            }

            boolean checkEmailExisted = DaoAuthentication.getInstance().checkEmailExisted(email);
            System.out.println(checkEmailExisted);
            if (!checkEmailExisted) {
                emailValidation = "Email is existed";
            }
            if (firstNameValidation == null
                    && lastNameValidation == null
                    && emailValidation == null
                    && passwordValidation == null
                    && confirmValidation == null) {
                User user = new User("",
                        firstName + " " + lastName,
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
                request.getRequestDispatcher("HomeControllerAdmin").forward(request, response);
                return;
            }


            request.setAttribute("firstNameValidation", firstNameValidation);
            request.setAttribute("lastNameValidation", lastNameValidation);
            request.setAttribute("emailValidation", emailValidation);
            request.setAttribute("passwordValidation", passwordValidation);
            request.setAttribute("confirmValidation", confirmValidation);
            request.getRequestDispatcher("/views/admin/authentication/signUp/signUp.jsp").forward(request, response);
        }
    }

    private void checkLengthTooLong(String type, String validation, int length) {
        if (type.length() > length) {
            validation = new String("length must be < " + length);
        }
    }

}
