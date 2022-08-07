package controller.sign_in;

import dao.sign.SignInDao;
import beans.User;
import dao.user.UserDao;
import service.customer.sign.SignInService;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "SignInController", value = "/SignInController")
public class SignInController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            response.setContentType("text/plain");
            response.setCharacterEncoding("UTF-8");

            SignInService signInService = new SignInService();
            // kiem tra email
            boolean checkEmail = signInService.checkEmail(email);
            if (!checkEmail) {
                response.getWriter().write("wrong email");
                return;
            }
            // kiem tra password
            String userId = signInService.checkPassword(email, password);
            if (userId == null) {
                // password sai
                response.getWriter().write("wrong password");
            }

            else {
                // password đúng
                String username = UserDao.getInstance().getUser(userId);
                HttpSession session = request.getSession(true);
                session.setAttribute("userId", userId);
                session.setAttribute("username", username);
                response.getWriter().write("true");
            }
    }
}