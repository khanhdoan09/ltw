package controller.order;

import beans.Checkout;
import dao.product.detail.DaoProductDetail;

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
        List<Checkout> listCheckout = new ArrayList<Checkout>();
        String[] productInCart = request.getParameterValues("checkbox_product_in_cart");
        for(String product : productInCart) {
            String[] data = product.split("_");
            String name = data[0];
            String idProduct = data[1];
            String color = data[2];
            int size = Integer.parseInt(data[3]);
            int quantity = Integer.parseInt(data[4]);
            double price = Double.parseDouble(data[5]);
            String urlImg = "";
            String idProductDetail = DaoProductDetail.getInstance().getIdProductDetail(idProduct, color, size);
            Checkout checkout = new Checkout(idProduct, idProductDetail, name, color, String.valueOf(size), urlImg, quantity, price);
            listCheckout.add(checkout);
        }

        HttpSession session = request.getSession();
        session.setAttribute("listProductInCheckout", listCheckout);
        request.setAttribute("listProductInCheckout", listCheckout);
        request.getRequestDispatcher("views.customer/checkout.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
