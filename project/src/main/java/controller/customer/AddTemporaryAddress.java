package controller.customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import beans.AddressCustomer;
import dao.user.DaoCustomerAddress;

@WebServlet(name = "AddTemporaryAddress", value = "/AddTemporaryAddress")
public class AddTemporaryAddress extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = (String) request.getParameter("name");
        String phone = (String) request.getParameter("phone");
        String email = (String) request.getParameter("email");
        String city = (String) request.getParameter("city");
        String district = (String) request.getParameter("district");
        String ward = (String) request.getParameter("ward");
        String address = "name: " + name + ", phone: " + phone + ", email: "  + email + "address: " +  (String) request.getParameter("address") ;
        String note = address + ", note: "  + (String) request.getParameter("note");
        AddressCustomer addressCustomer = new AddressCustomer(city, district, ward, address, "1", name, phone, email, "15");
        String idAddress = DaoCustomerAddress.getInstance().addAddressTemporary(addressCustomer);
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(idAddress);
    }
}
