package controller.admin;

import controller.ListProduct;
import model.Admin.DaoProductAdmin;
import model.DaoProduct;
import model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "ListProductAdmin", value = "/ListProductAdmin")
public class ListProductAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String removeProduct = request.getParameter("removeProduct");
        if (removeProduct != null) {
            removeProduct(removeProduct, response);
        }
        else {
            getListProduct(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    public void getListProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("type");
        String[] name = request.getParameterValues("name");
        String paginationProduct = request.getParameter("pagination");
        int pagination = 0;
        if (paginationProduct != null)  // just count when call this function first time
            pagination = Integer.parseInt(paginationProduct);

        List<Product> list=null;
        ArrayList<String>listName=null;
        String sql = "";
        if (type.equals("brand")) {
            sql =  DaoProduct.getInstance().getProductByCategory("brand", name);
            listName = new ArrayList<String>(Arrays.asList(name));
        }
        else if (type.equals("id")) {
            sql =  DaoProduct.getInstance().getProductByCategory("id", name);
            listName = new ArrayList<String>(Arrays.asList(name));
        }
        else if (type.equals("name")) {
            sql =  DaoProduct.getInstance().getProductByCategory("name", name);
            listName = new ArrayList<String>(Arrays.asList(name));
        }
        String sqlAll = "SELECT DISTINCT product.id, brand, name, category, price, saleRate, product.Active, img FROM product INNER JOIN linkimg ON product.id=linkimg.id && linkimg.level=0 WHERE " + sql +  " GROUP BY product.id LIMIT "+pagination*9+", 9";
        list = DaoProduct.getInstance().excQuery(listName,sqlAll);
        if (pagination != 0) { // not use when first time submit
            if (list.size() == 0){ // no more data
                response.setContentType("text/html");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write("no more data");
            }else{
            response.setContentType("text/html");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(this.toJson(list));
            }
            return;
        }

        System.out.println(name[0]);
        request.setAttribute("type", name[0]);
        request.setAttribute("listProduct", list);
        request.getRequestDispatcher("order-invoices.jsp").forward(request, response);
    }

    public void removeProduct(String id, HttpServletResponse response) throws IOException {
        boolean isDeleted = DaoProductAdmin.getInstance().deleteProductInAdmin(id);
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        if (isDeleted)
        response.getWriter().write("remove success");
        else
            response.getWriter().write("remove fail");
    }

    public String toJson(List<Product> listFilter) {
        String json = "[";
        for (Product product : listFilter) {
            json += "\n"+product.toJson() +",";
        }
        json = json.substring(0, json.length()-1)+"\n";
        json += "]";
        return json;
    }

}
