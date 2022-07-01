package controller.admin.product;

import com.google.gson.Gson;
import dao.product.DaoProductAdmin;
import beans.Product;
import service.admin.ProductAdminService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "ListProductAdmin", value = "/ListProductAdmin")
public class ListProductAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("type");
        String[] name = request.getParameterValues("name");
        String paginationProduct = request.getParameter("pagination");
        int pagination = 0;
        if (paginationProduct != null)  // just count when call this function first time
            pagination = Integer.parseInt(paginationProduct);

        List<Product> list=null;
        ArrayList<String>listParameterOfCondition=null;
        ProductAdminService productAdminService = new ProductAdminService();

        String sql = "";
        if (type.equals("brand")) {
            sql =  productAdminService.getSqlWithCondition("brand", name);
            listParameterOfCondition = new ArrayList<String>(Arrays.asList(name));
        }
        else if (type.equals("id")) {
            sql =  productAdminService.getSqlWithCondition("id", name);
            listParameterOfCondition = new ArrayList<String>(Arrays.asList(name));
        }
        else if (type.equals("name")) {
            sql =  productAdminService.getSqlWithCondition("name", name);
            listParameterOfCondition = new ArrayList<String>(Arrays.asList(name));
        }
        String sqlAll = "SELECT DISTINCT product.id, brand, name, category, price, saleRate, product.Active, img FROM product INNER JOIN linkimg ON product.id=linkimg.id && linkimg.level=0 WHERE " + sql +  " GROUP BY product.id LIMIT "+pagination*9+", 9";
        list = productAdminService.getListProduct(listParameterOfCondition,sqlAll);

        // when use load more
        if (pagination != 0) { // not use when first time submit
            if (list.size() == 0){ // no more data
                response.setContentType("text/html");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write("no more data");
            }else{
                response.setContentType("text/html");
                response.setCharacterEncoding("UTF-8");
                String listProductResult = new Gson().toJson(list);
                response.getWriter().write(listProductResult);
            }
            return;
        }

        request.setAttribute("type", name[0]);
        request.setAttribute("listProduct", list);
        request.getRequestDispatcher("/views/admin/crud/product/list-product.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }


}
