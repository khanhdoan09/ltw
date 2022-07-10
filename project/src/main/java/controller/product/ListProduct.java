package controller.product;

import dao.product.DaoProduct;
import beans.Product;
import dao.product.search.DaoSearchProduct;
import service.customer.product.search.SearchService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "ListProduct", value = "/ListProduct")
public class ListProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] type = request.getParameterValues("type");
        String[] order = request.getParameterValues("order");
        String[] name = request.getParameterValues("name");
        System.out.println(type + " " + order + " " + name);
        String sql="";
        ArrayList<String> list = new ArrayList<String>();
        SearchService searchService = new SearchService();

        if (type != null) {
            if (type[0].equals("brand")) {
                sql += searchService.getSqlSearchWithCondition("brand", name);
                list.addAll(Arrays.asList(name));
            }
        }
        if (order != null) {
            sql += searchService.getSqlSearchWithCondition("brand", name);
            if (order[0].equals("DESC"))
                sql += searchService.getSqlSearchWithCondition("highestPrice", order);
            else
                sql += searchService.getSqlSearchWithCondition("lowestPrice", order);
        }

        List<Product> listFilter = null;
        String group = " GROUP BY product.id ";
        String pagination = request.getParameter("pagination");
        String limit = " LIMIT " + (Integer.parseInt(pagination)-1)*9 + ", 9" ;
        String sqlAll="";
        String[] item = request.getParameterValues("item");
        if (item != null) {
            String[] orderType = request.getParameterValues("orderType");
            sqlAll = "SELECT DISTINCT product.id, brand, name, category, price, saleRate, product.Active, img FROM product INNER JOIN linkimg ON product.id=linkimg.idProduct && linkimg.level=0 " + sql + group ;
            sql += " ORDER BY "+item[0] + " " + orderType[0] + " " + limit;
            sqlAll += sql;
            listFilter = DaoSearchProduct.getInstance().getListProduct(list, sqlAll);
            response.setContentType("text/html");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(this.toJson(listFilter));
            return;
        }
        request.setAttribute("type",type[0]);
        request.setAttribute("name", name[0]);

        sqlAll = "SELECT DISTINCT product.id, brand, name, category, price, saleRate, product.Active, img FROM product INNER JOIN linkimg ON product.id=linkimg.idProduct && linkimg.level=0 " + sql + group + limit;
        listFilter = DaoSearchProduct.getInstance().getListProduct(list,  sqlAll);
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(this.toJson(listFilter));
        if (Integer.parseInt(pagination)>1) {
            return;
        }
        request.setAttribute("listFilter", listFilter);
        request.getRequestDispatcher("/list-product.jsp").forward(request, response);
        return;

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



