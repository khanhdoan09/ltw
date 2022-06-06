package controller.customer;

import bean.AddressCustomer;
import com.google.gson.Gson;
import model.customer.DaoCustomerAddress;

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
        String customerId = "12";
        List<AddressCustomer> listAddress =  DaoCustomerAddress.getInstance().getAddress(customerId);
        String json = new Gson().toJson(listAddress);

        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }
}
