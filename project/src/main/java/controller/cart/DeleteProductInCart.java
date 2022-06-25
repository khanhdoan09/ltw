package controller.cart;

import beans.ProductInCart;
import dao.cart.DaoCart;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DeleteProductInCart", value = "/DeleteProductInCart")
public class DeleteProductInCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idProduct = request.getParameter("idProduct");
        String idCustomer = request.getParameter("idCustomer");
        String colorShoe= request.getParameter("colorShoe");
        int size= Integer.parseInt(request.getParameter("size"));
        ProductInCart productInCart = new ProductInCart(idCustomer, idProduct, colorShoe, size);
        System.out.println(123123);
        DaoCart.getInstance().deleteProductInCart(productInCart);

        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("ok");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
