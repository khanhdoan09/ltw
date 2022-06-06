package controller.customer;

import model.customer.DaoCustomerAddress;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "EditAddressController", value = "/editAddress")
public class EditAddressController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idCity = request.getParameter("idCity");
        String idDistrict = request.getParameter("idDistrict");
        String idWard = request.getParameter("idWard");
        String description = request.getParameter("description");
        String idAddress = request.getParameter("idAddress");
        System.out.println(idCity+""+idDistrict+""+idWard+""+description+""+idAddress + "~~~");
        boolean isChange = DaoCustomerAddress.getInstance().editAddress(idAddress, idCity, idDistrict, idWard, description);
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
