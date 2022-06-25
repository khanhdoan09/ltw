package controller.sign_up;

import beans.User;
import dao.sign.SignInDao;
import dao.sign.SignUpDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "SignUpController", value = "/SignUpController")
public class SignUpController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        SignUpDao dao = SignUpDao.getInstance();
        User user = new User(email, password);

        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");

        boolean validationFlag = dao.checkEmailExist(user);
        if (!validationFlag) {
            System.out.println(email +"~~~"+password);
            response.getWriter().write("email exist");
            return;
        }
        else {
            String userId = dao.createNewUser(user);
            HttpSession session = request.getSession(true);
            session.setAttribute("userId", userId);
        }
        response.getWriter().write("true");
    }
}
