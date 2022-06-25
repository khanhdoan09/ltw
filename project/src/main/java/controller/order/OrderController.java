package controller.order;

import beans.ProductInCheckout;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "OrderController", value = "/OrderController")
public class OrderController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println(request.getParameter("idCustomer"));
        List<ProductInCheckout> listProductInCheckout = new ArrayList<ProductInCheckout>();
        String[] productInCart = request.getParameterValues("checkbox_product_in_cart");
        for(String product : productInCart) {
            String[] data = product.split("_");
            String name = data[0];
            String idProduct = data[1];
            String color = data[2];
            String size = data[3];
            int quantity = Integer.parseInt(data[4]);
            double price = Double.parseDouble(data[5]);
            String urlImg = "";
            System.out.println(name+"~"+idProduct+"~"+color+"~"+size+"~"+quantity+"~"+price);
            ProductInCheckout productInCheckout = new ProductInCheckout(idProduct, name, color, size, urlImg, quantity, price);
            listProductInCheckout.add(productInCheckout);
        }

        HttpSession session = request.getSession();
        session.setAttribute("listProductInCheckout", listProductInCheckout);
        request.setAttribute("listProductInCheckout", listProductInCheckout);
        request.getRequestDispatcher("views.customer/checkout.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
