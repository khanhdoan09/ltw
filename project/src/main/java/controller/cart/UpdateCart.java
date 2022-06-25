package controller.cart;

import beans.ProductInCart;
import dao.cart.DaoCart;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CartCustomerController", value = "/updateCart")
public class UpdateCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idShoe = request.getParameter("idProduct");
        String idCustomer = request.getParameter("idCustomer");
        int quantityShoe = Integer.parseInt(request.getParameter("quantity"));
        int sizeShoe = Integer.parseInt(request.getParameter("size"));
        String colorShoe = request.getParameter("color");
        String productName = request.getParameter("productName");
        String productBrand = request.getParameter("productBrand");
        double productPrice = Double.parseDouble(request.getParameter("productPrice"));
        ProductInCart productInCart = new ProductInCart("123", idShoe, colorShoe, quantityShoe,  sizeShoe, productName, productBrand, productPrice);
        DaoCart.getInstance().insertShoeToCart(productInCart);

        List<ProductInCart> listProductInCart = DaoCart.getInstance().getListProductInCart(idCustomer);

        request.setAttribute("idCustomer", idCustomer);
        request.setAttribute("listProductInCart", listProductInCart);
        request.setAttribute("cart", productInCart);
        request.getRequestDispatcher("views.customer/cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
