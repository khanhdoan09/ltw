package controller.sign_in;

import dao.sign.SignInDao;
import beans.User;

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

            SignInDao dao = SignInDao.getInstance();
            User user = new User(email, password);

            response.setContentType("text/plain");
            response.setCharacterEncoding("UTF-8");

            boolean validationFlag = dao.checkEmail(user);
            if (!validationFlag) {
                response.getWriter().write("wrong email");
                return;
            }
            String userId = dao.checkPassword(user);
            if (userId == null) {
                response.getWriter().write("wrong password");
                return;
            }

            HttpSession session = request.getSession(true);
            session.setAttribute("userId", userId);

            response.getWriter().write("true");
    }
}