package controller.admin.authentication;

import controller.admin.authentication.api.ConstantsSignIn;
import controller.admin.authentication.api.GoogleItem;
import controller.admin.authentication.api.GooglePojo;
import dao.user.DaoAuthentication;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "SignIn", value = "/SignIn")
public class SignIn extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("code");
        if (code != null) {
            String accessToken = GoogleItem.getToken(code, ConstantsSignIn.GOOGLE_LINK_GET_TOKEN, ConstantsSignIn.GOOGLE_CLIENT_ID, ConstantsSignIn.GOOGLE_CLIENT_SECRET, ConstantsSignIn.GOOGLE_REDIRECT_URI, ConstantsSignIn.GOOGLE_GRANT_TYPE);
            GooglePojo googlePojo = GoogleItem.getUserInfo(accessToken);
            request.setAttribute("id", googlePojo.getId());
            request.setAttribute("name", googlePojo.getName());
            request.setAttribute("email", googlePojo.getEmail());
            System.out.println(googlePojo.getId() + " " + googlePojo.getName() + " " + googlePojo.getEmail());
            if (DaoAuthentication.getInstance().checkPassword(googlePojo.getId()) == false) {
                request.getSession(true).setAttribute("user", true);
                request.getRequestDispatcher("/Route?page=listProduct").forward(request, response);
                return;
            }
            request.getRequestDispatcher("/views/admin/authentication/signIn/signInAdmin.jsp").forward(request, response);
            return;
        }
        else {
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            String emailValidation = null;
            String passwordValidation = null;
            response.setContentType("text/html");
            response.setCharacterEncoding("UTF-8");
            boolean emailExisted = DaoAuthentication.getInstance().checkEmailExisted(email);
            if (emailExisted) {
                emailValidation = " Email not exist ";
                response.getWriter().write("email not exist");
                return;
            }
            if (email.isEmpty()) {
                emailValidation = " Email must be not empty";
            }
            if (password.isEmpty()) {
                passwordValidation = " Password must be not empty";
            }
            if (emailValidation == null && passwordValidation == null) {
                if (DaoAuthentication.getInstance().checkPassword(password) == false) {
                    HttpSession session = request.getSession(true);

                    session.setMaxInactiveInterval(900); // set timeout in 15 minute
                    int role = DaoAuthentication.getInstance().getRole(email, password);
                    request.getSession(true).setAttribute("roleAdmin", role);
                    request.getSession(true).setAttribute("userAdmin", true);
                    request.getSession(true).setAttribute("adminName", email);
                    request.getSession(true).setAttribute("idAdmin" , DaoAuthentication.getInstance().getIdAdmin(email,password));
                    response.getWriter().write("ok");
                    //                    response.sendRedirect("HomeControllerAdmin");
                    return;
                }
                else {
                    response.getWriter().write("password wrong");
                    return;
                }
            }
            request.setAttribute("emailValidation", emailValidation);
            request.setAttribute("passwordValidation", passwordValidation);
            request.getRequestDispatcher("/views/admin/authentication/signIn/signInAdmin.jsp").forward(request, response);
        }
    }
}
