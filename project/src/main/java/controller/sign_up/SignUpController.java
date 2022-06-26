package controller.sign_up;

import beans.User;
import dao.sign.SignInDao;
import dao.sign.SignUpDao;
import service.customer.sign.SignUpService;

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

        SignUpService signUpService = new SignUpService();

        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");

        boolean validationFlag = signUpService.checkEmailExist(email);
        // email đã tồn tại
        if (!validationFlag) {
            System.out.println(email +"~~~"+password);
            response.getWriter().write("email exist");
            return;
        }
        else {
            String userId = signUpService.createNewUser(email, password);
            HttpSession session = request.getSession(true);
            session.setAttribute("userId", userId);
        }
        response.getWriter().write("true");
    }
}
