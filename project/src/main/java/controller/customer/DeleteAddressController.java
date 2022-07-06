package controller.customer;

import dao.user.DaoCustomerAddress;
import service.customer.personal.PersonalAddressService;

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
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("userId");
        if(obj != null) {
            request.getRequestDispatcher("./views.customer/index.jsp").forward(request, response);
            return;
        }
        String idCustomer = (String) obj;

        String idAddress = request.getParameter("idAddress");
        PersonalAddressService personalAddressService = new PersonalAddressService();
        boolean isDelete = personalAddressService.deleteAddress(idAddress, idCustomer);
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
