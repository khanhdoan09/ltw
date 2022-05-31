package controller;

import model.User;
import model.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "Login", value = "/Login")
public class Login extends HttpServlet {
public  Login(){

}
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    try {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDao dao = UserDao.getInstance();
        User use = new User(email,password);

        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");

        boolean validationFlag = dao.checkEmail(use);
        if (!validationFlag) {
            response.getWriter().write("wrong email");
            return;
        }
        validationFlag = dao.checkPassword(use);
        if (!validationFlag) {
            response.getWriter().write("wrong password");
            return;
        }
        response.getWriter().write("true");
    } catch (Exception e) {

        e.printStackTrace();
    }
        }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
