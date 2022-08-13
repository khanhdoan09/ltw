package controller.admin.customer;

import dao.user.DaoUserAdmin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "RemoveUser", value = "/RemoveUserAdmin")
public class RemoveUser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String role = request.getSession().getAttribute("roleAdmin").toString();
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        if (role.equals("2")) {
            response.getWriter().write("must be admin");
        }
        else if (role.equals("1")) {
            String roleOfUserToRemove = DaoUserAdmin.getInstance().getRole(id);
            if (roleOfUserToRemove.equals("0")) {
                response.getWriter().write("không được xóa khách hàng");
            }
            else if (roleOfUserToRemove.equals("1")) {
                response.getWriter().write("không được xóa admin");
            }
            else if (roleOfUserToRemove.equals("2")) {
                if (DaoUserAdmin.getInstance().removeUser(id)){
                    response.getWriter().write("Xóa thành công");
                }
                else {
                    response.getWriter().write("Lỗi");
                }
            }
        }
        else {
            response.getWriter().write("Lỗi");
        }
    }
}
