package controller.cart;

import beans.Cart;
import dao.cart.DaoCart;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UpdateQuantityCart", value = "/UpdateQuantityCart")
public class UpdateQuantityCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("userId");
        String idCustomer = obj.toString();
        String idProductDetail = (String) request.getParameter("idProductDetail");
        int newQuantity = (Integer.parseInt(request.getParameter("quantity")));
        Cart cart = new Cart(idCustomer, idProductDetail, newQuantity);
        System.out.println(idCustomer + "~" + idProductDetail + "~"  + newQuantity);
        DaoCart.getInstance().updateQuantityShoe(cart);

        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("ok");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
