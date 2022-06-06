package controller.customer;

import model.customer.DaoCustomerAddress;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AdressController", value = "/adress")
public class AddAdressController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String city = request.getParameter("city");
        String district = request.getParameter("district");
        String ward = request.getParameter("ward");
        String description = request.getParameter("description");

        String customerId = "12";
        boolean isChange = DaoCustomerAddress.getInstance().addAddress(customerId, city, district, ward, description);
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        if (isChange) {
            response.getWriter().write("true");
        }
        else {
            response.getWriter().write("false");
        }
    }
}
