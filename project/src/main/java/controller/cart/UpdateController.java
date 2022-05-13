package controller.cart;

import model.Cart;
import model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "UpdateController", value = "/Cart-update")
public class UpdateController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String id =  request.getParameter("id");
        String quantity =  request.getParameter("quantity");
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null)
            cart = Cart.getInstance();
        Product p = cart.get(id);

        System.out.println(quantity);
        if (p == null) {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            return;
        }
        int quantitySold = Integer.parseInt(quantity);
        p.setQuantitySold(quantitySold);
        if(p.getQuantitySold() != quantitySold)
            response.setStatus(485);
        System.out.println(p.getQuantitySold());
    }
}
