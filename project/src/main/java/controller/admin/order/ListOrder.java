package controller.admin.order;

import com.google.gson.Gson;
import dao.order.DaoOrderAdmin;
import beans.OrderInAdmin;
import service.admin.OrderAdminService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ListOrder", value = "/ListOrderAdmin")
public class ListOrder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String paginationProduct = request.getParameter("pagination");
        int pagination = 0;
        if (paginationProduct != null)  // just count when call this function first time
            pagination = Integer.parseInt(paginationProduct);

        String sql = "SELECT id,customer,total_price, create_at, status FROM orders LIMIT "+pagination*9+", 9";
        OrderAdminService orderAdminService = new OrderAdminService();

        List<OrderInAdmin> orders = orderAdminService.getListOrder(sql);

        // when use load more
        if (pagination != 0) { // not use when first time submit
            if (orders.size() == 0){ // no more data
                response.setContentType("text/html");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write("no more data");
            }else{
                response.setContentType("text/html");
                response.setCharacterEncoding("UTF-8");
                String listProductResult = new Gson().toJson(orders);
                response.getWriter().write(listProductResult);
            }
            return;
        }

        request.setAttribute("orders", orders);
        request.getRequestDispatcher("/views/admin/crud/order/order.jsp").forward(request, response);
    }
}
