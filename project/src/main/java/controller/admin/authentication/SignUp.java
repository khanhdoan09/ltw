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


            boolean checkEmailExisted = DaoAuthentication.getInstance().checkEmailExisted(email);
            response.setContentType("text/html");
            response.setCharacterEncoding("UTF-8");
            if (!checkEmailExisted) {
                response.getWriter().write("email exist");
                return;
            }

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

                response.getWriter().write("ok");

//                request.getRequestDispatcher("HomeControllerAdmin").forward(request, response);
                return;
            }



    }

    private void checkLengthTooLong(String type, String validation, int length) {
        if (type.length() > length) {
            validation = new String("length must be < " + length);
        }
    }

}
