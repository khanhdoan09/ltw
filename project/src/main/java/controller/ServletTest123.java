package controller;

import model.DaoProduct;
import model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "ServletTest123", value = "/ServletTest123")
public class ServletTest123 extends HttpServlet {
    private int pagination = 1;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String a = request.getParameter("category");
        Object b = request.getParameter("categoryGender");
        String pag = request.getParameter("pagination");
        if (pag != null) {
            pagination = Integer.parseInt(pag);
        }

        String category = a;
        System.out.println(category);
        List<Product> listFilter = new ArrayList<Product>();
        String folderImage = "";
        int totalNumberProduct = 0;

        String[] categoriesByOnNav = request.getParameterValues("categoryOnNav");
        String[] brandsByOnNav = request.getParameterValues("brandOnNav");
        // by panel filter
        String[] brands = request.getParameterValues("brand");
        String[] underPrice = request.getParameterValues("underPrice");
        String[] fromPrice = request.getParameterValues("fromPrice");
        String[] toPrice = request.getParameterValues("toPrice");
        String[] upPrice = request.getParameterValues("upPrice");
        String[] fromInputPrice = request.getParameterValues("fromInputPrice");
        String[] toInputPrice = request.getParameterValues("toInputPrice");
        String[] highestLowest = request.getParameterValues("highestLowest");
        String[] star = request.getParameterValues("star");


        ArrayList<String> list = new ArrayList<String>();
        // nav filter
        if (categoriesByOnNav != null) {
            listFilter = DaoProduct.getInstance().getProductByCategoryByNav("categoryOnNav", categoriesByOnNav[0], pagination);
            totalNumberProduct = 27;

            DaoProduct.currentCategory = categoriesByOnNav[0];
            // use for form action
            request.setAttribute("TypeCategory", "category");
            request.setAttribute("ValueCategory", categoriesByOnNav[0]);
        }
        else if (brandsByOnNav != null) {
            listFilter = DaoProduct.getInstance().getProductByCategoryByNav("brandOnNav", brandsByOnNav[0], pagination);
            totalNumberProduct = 27;
            // use for form action
            request.setAttribute("TypeCategory", "brand");
            request.setAttribute("ValueCategory", brandsByOnNav[0]);
        }
        else {
            // panel filter
            String categoryT = request.getParameter("category");
            String brandT = request.getParameter("brand");

            String sql = "";
            if (categoryT != null) {
                request.setAttribute("TypeCategory", "category");
                request.setAttribute("ValueCategory", categoryT);
                sql = "SELECT id, brand, name, category, price, saleRate, Active FROM product WHERE category=\"" + categoryT + "\"";
            }
            else if (categoryT == null) {
                request.setAttribute("TypeCategory", "brand");
                request.setAttribute("ValueCategory", brandT);
                sql = "SELECT id, brand, name, category, price, saleRate, Active FROM product WHERE brand=\"" + brandT + "\" && ";
            }
            if (brands != null) {
                sql += DaoProduct.getInstance().getProductByCategory("brand", brands, pagination);
                DaoProduct.getInstance().getTotalNumberProduct("brand", brands);
                list.addAll(Arrays.asList(brands));
            }
            if (underPrice != null) {
                sql += DaoProduct.getInstance().getProductByCategory("underPrice", underPrice, pagination);
                DaoProduct.getInstance().getTotalNumberProduct("underPrice", underPrice);
                list.addAll(Arrays.asList(underPrice));
            }
            if (fromPrice != null && toPrice != null) {
                String[] fromToPrice = {fromPrice[0], toPrice[0]};
                sql += DaoProduct.getInstance().getProductByCategory("fromToPrice", fromToPrice, pagination);
                DaoProduct.getInstance().getTotalNumberProduct("fromToPrice", fromToPrice);
                list.addAll(Arrays.asList(fromToPrice));
            }
            if (upPrice != null) {
                sql += DaoProduct.getInstance().getProductByCategory("upPrice", upPrice, pagination);
                DaoProduct.getInstance().getTotalNumberProduct("upPrice", upPrice);
                list.addAll(Arrays.asList(upPrice));
            }

            if (fromInputPrice != null && toInputPrice != null) {
                String[] fromToPrice = {fromInputPrice[0], toInputPrice[0]};
                sql += DaoProduct.getInstance().getProductByCategory("fromToPrice", fromToPrice, pagination);
                DaoProduct.getInstance().getTotalNumberProduct("fromToPrice", fromToPrice);
                list.addAll(Arrays.asList(fromToPrice));
            }
            if (star != null) {
                sql += DaoProduct.getInstance().getProductByCategory("star", star, pagination);
                DaoProduct.getInstance().getTotalNumberProduct("star", star);
                list.addAll(Arrays.asList(star));
            }
            if (highestLowest != null) {
                if (highestLowest[0].equals("DESC")) {
                    sql += DaoProduct.getInstance().getProductByCategory("highestPrice", highestLowest, pagination);
                    DaoProduct.getInstance().getTotalNumberProduct("highestPrice", highestLowest);
                }
                else{
                    sql += DaoProduct.getInstance().getProductByCategory("lowestPrice", highestLowest, pagination);
                    DaoProduct.getInstance().getTotalNumberProduct("lowestPrice", highestLowest);
                }
            }
            request.setAttribute("sql", sql);
            listFilter = DaoProduct.getInstance().excQuery(list, pagination, sql);
            totalNumberProduct = DaoProduct.getInstance().excQueryTotal(list, pagination);
        }
        request.setAttribute("TotalNumberProduct", totalNumberProduct);
        request.setAttribute("Pagination", pagination);
        request.setAttribute("folderImage", folderImage);
        request.setAttribute("categoryProduct", listFilter);
        request.setAttribute("category", a);
        request.setAttribute("categoryGender", b);

        request .getRequestDispatcher("category.jsp").forward(request, response);

    }

}