package controller.customer;

import service.customer.personal.PersonalAddressService;
import service.customer.personal.PersonalCustomerService;

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
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("userId");
        if(obj != null) {
            request.getRequestDispatcher("./views.customer/index.jsp").forward(request, response);
            return;
        }
        String idCustomer = (String) obj;
        String city = request.getParameter("city");
        String district = request.getParameter("district");
        String ward = request.getParameter("ward");
        String description = request.getParameter("description");

        PersonalAddressService personalCustomerService = new PersonalAddressService ();
        boolean isChange = personalCustomerService.addAddress(idCustomer, city, district, ward, description);
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
