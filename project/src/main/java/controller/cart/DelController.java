package controller.cart;

import model.Cart;
import model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Del", value = "/Cart-remove")
public class DelController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String id =  request.getParameter("id");
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = Cart.getInstance();
            Product remove = cart.remove(id);
            response.sendRedirect("");
            session.setAttribute("cart", cart);
            if (remove == null) {
                response.setStatus(HttpServletResponse.SC_ACCEPTED);
            }
        }
        cart.remove(id);

    }
}
