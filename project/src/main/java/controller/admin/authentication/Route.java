package controller.admin.authentication;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "Route", value = "/Route")
public class Route extends HttpServlet {
    @Override
    // do đường dẫn kiểu vậy http://localhost:8080/project_war_exploded/views/admin/crud/product/SaveAddProduct
    // khi tới controller
    // nên dùng route
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page = request.getParameter("page");
        if (page.equals("listProduct")) {
            request.getRequestDispatcher("/views/admin/crud/product/order-invoices.jsp").forward(request, response);
        }
        else if (page.equals("customer")) {
            request.getRequestDispatcher("/views/admin/crud/customer/customer-admin.jsp").forward(request, response);
        }
        else if (page.equals("order")) {
            request.getRequestDispatcher("/views/admin/crud/order/order.jsp").forward(request, response);
        }
        else if (page.equals("orderDetail")) {
            String idOrder = request.getParameter("idOrder");
            request.getRequestDispatcher("/ListOrderDetail?idOrder="+idOrder).forward(request, response);
        }
        else if (page.equals("listProductForm")) {
            request.getRequestDispatcher("/ListProductAdmin").forward(request, response);
        }
        else if (page.equals("listProductForm")) {
            request.getRequestDispatcher("/ListProductAdmin").forward(request, response);
        }
        else if (page.equals("addProduct")) {
            System.out.println(12345678);
            request.getRequestDispatcher("/SaveAddProduct").forward(request, response);
        }
        else if (page.equals("addNewProduct")) {
            request.getRequestDispatcher("/views/admin/crud/product/addProduct.jsp").forward(request, response);
        }
        else if (page.equals("editProduct")) {
            String id = request.getParameter("id");
            request.getRequestDispatcher("/EditProduct?id="+id).forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       // login dung form
        doGet(request, response);
    }
}
