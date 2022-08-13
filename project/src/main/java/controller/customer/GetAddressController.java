package controller.customer;

import beans.AddressCustomer;
import com.google.gson.Gson;
import dao.user.DaoCustomerAddress;
import service.customer.personal.PersonalAddressService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "GetAddressController", value = "/getAddress")
public class GetAddressController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("userId");
        String idCustomer = (String) obj;
        PersonalAddressService personalAddressService = new PersonalAddressService();
        List<AddressCustomer> listAddress =  personalAddressService.getAddress(idCustomer);
        String json = new Gson().toJson(listAddress);

        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }
}
