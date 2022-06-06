package controller.customer;

import model.customer.DaoCustomerAddress;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DeleteAddressController", value = "/deleteAddress")
public class DeleteAddressController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idAddress = request.getParameter("idAddress");
        boolean isDelete = DaoCustomerAddress.getInstance().deleteAddress(idAddress);
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        if (isDelete) {
            response.getWriter().write("true");
        }
        else {
            response.getWriter().write("false");
        }
    }
}
