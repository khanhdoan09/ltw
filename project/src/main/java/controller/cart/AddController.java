package controller.cart;

import model.Cart;
import model.DaoProduct;
import bean.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "AddController", value = "/AddCart")
public class AddController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//    get id from url
        String id = request.getParameter("id");
//        get cart from session
        HttpSession session =request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = Cart.getInstance();
        }
        Product p = DaoProduct.getInstance().getProductById(id);

//        add item cart
        cart.put(p);
//        save cart to session
        session.setAttribute("cart", cart);
//        redirect to cart session
//        request.getRequestDispatcher("/cart.jsp").forward(request,response);
        response.sendRedirect("/project/Cart");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doGet(request,response);
    }
}
