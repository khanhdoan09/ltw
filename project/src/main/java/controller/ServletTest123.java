package controller;

import model.DaoBanner;
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
import java.util.Map;

@WebServlet(name = "ServletTest123", value = "/ServletTest123")
public class ServletTest123 extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    String pag;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String wordSearchHeader = request.getParameter("wordSearchHeader");
        if (wordSearchHeader != null) {
            response.setContentType("text/plain");
            response.setCharacterEncoding("UTF-8");
            List<Product> words = DaoProduct.getInstance().getDataFromWordInSearchHeader(wordSearchHeader);
            if (words != null) {
                response.getWriter().write(DaoProduct.getInstance().analysisArrayList(words));
            }
            else
                response.getWriter().write("none");
            return;
        }


        int pagination = 1;
        pag = request.getParameter("pagination");
        if (pag != null) {
            pagination = Integer.parseInt(pag.toString());
        }

        List<Product> listFilter = null;
        String folderImage = "";
        int totalNumberProduct = 0;


        String group = " GROUP BY product.id ";
        String limit = " LIMIT 0,9 ";

        String categoryGender = request.getParameter("categoryGender");

        String[] categoriesByOnNav = request.getParameterValues("categoryOnNav");
        String[] brandsByOnNav = request.getParameterValues("brandOnNav");
        // by panel filter
        String[] size = request.getParameterValues("size");
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

        String[] searchInHeader = request.getParameterValues("input-search-header");
        String sql = "";
        String sqlAllCount = "SELECT COUNT(product.id) FROM product ";

        if (categoryGender != null){
            if (categoryGender.equals("Man")) {
                request.setAttribute("categoryGender", "Man");
            }
            else
                request.setAttribute("categoryGender", "Woman");

        }
        else if (categoriesByOnNav != null) {
            listFilter = new ArrayList<Product>();
            listFilter = DaoProduct.getInstance().getProductByCategoryByNav("categoryOnNav", categoriesByOnNav[0], pagination);
            sql += "  WHERE "+DaoProduct.getInstance().getTotalNumberProduct("category", categoriesByOnNav);
            list.addAll(Arrays.asList(categoriesByOnNav));
            // use for form action
            request.setAttribute("TypeCategory", "category");
            request.setAttribute("ValueCategory", categoriesByOnNav[0]);
        }
        else {
            listFilter = new ArrayList<Product>();
            // panel filter
            String[] categoryT = request.getParameterValues("category");
            String brandT = request.getParameter("brand");

            if (searchInHeader != null) {
                sql = "  WHERE "; // 1=1 la do && brand = ""
                sql += DaoProduct.getInstance().getProductByCategory("searchInHeader", searchInHeader, pagination);
                request.setAttribute("TypeCategory", "input-search-header");
                request.setAttribute("ValueCategory", searchInHeader[0]);
                searchInHeader[0] = "%"+searchInHeader[0]+"%";
                list.add(searchInHeader[0]);
            }
            else if (categoryT != null) {
                request.setAttribute("TypeCategory", "category");
                request.setAttribute("ValueCategory", categoryT[0]);
                sql = " WHERE category=? ";
                list.addAll(Arrays.asList(categoryT));
            }
            else if (categoryT == null) { // luc nay la tim kiem bang brand tren navigation
                request.setAttribute("TypeCategory", "brand");
                request.setAttribute("ValueCategory", brandT);
                sql = " WHERE (1=1) "; // 1=1 la do && brand = ""
            }
            if (size != null) {
                sql = "JOIN product_detail ON product.id=product_detail.id " + sql + DaoProduct.getInstance().getProductByCategory("size", size, pagination);
                list.addAll(Arrays.asList(size));
            }
            if (brands != null) {
                sql += DaoProduct.getInstance().getProductByCategory("brand", brands, pagination);
                list.addAll(Arrays.asList(brands));
            }
            if (underPrice != null) {
                sql += DaoProduct.getInstance().getProductByCategory("underPrice", underPrice, pagination);
                list.addAll(Arrays.asList(underPrice));
            }
            if (fromPrice != null && toPrice != null) {
                String[] fromToPrice = {fromPrice[0], toPrice[0]};
                if (sql.contains(" price ")) { // de khoang trang de phan biet ,price trong select sql
                    sql = sql.substring(0, sql.length()-1);
                    sql += " || ";
                }
                else {
                    sql += " && ( ";

                }
                sql += DaoProduct.getInstance().getProductByCategory("fromToPrice", fromToPrice, pagination);
                list.addAll(Arrays.asList(fromToPrice));
            }
            if (upPrice != null) {
                if (sql.contains(" price ")) {
                    sql = sql.substring(0, sql.length()-1);
                    sql += " || ";
                }
                else
                    sql += " && ( ";

                sql += DaoProduct.getInstance().getProductByCategory("upPrice", upPrice, pagination);
                list.addAll(Arrays.asList(upPrice));
            }
            if (fromInputPrice != null && toInputPrice != null) {
                try {
                    int to=0;
                    int from=0;
                    try {
                        from = Integer.parseInt(fromInputPrice[0]);
                    } catch (Exception e) {
                        throw new NumberFormatException("from not valid");
                    }
                    try {
                        to = Integer.parseInt(toInputPrice[0]);
                    } catch (Exception e) {
                        throw new NumberFormatException("to not valid");
                    }

                    if (from > to)
                        throw new ArithmeticException("from not bigger to");
                    else if (to < 0)
                        throw new ArithmeticException("to not less than 0");
                    else if (from < 0)
                        throw new ArithmeticException("from not less than 0");

                    if (sql.contains(" price ")) {
                        sql = sql.substring(0, sql.length()-1);
                        sql += " || ";
                    }
                    else
                        sql += " && ( ";

                    String[] fromToPrice = {"10", "100"};
                    sql += DaoProduct.getInstance().getProductByCategory("fromToPrice", fromToPrice, pagination);
                    list.addAll(Arrays.asList(fromToPrice));
                } catch (NumberFormatException e) {
                    request.setAttribute("errorInputPrice", e.getMessage());
                } catch (ArithmeticException e) {
                    request.setAttribute("errorInputPrice", e.getMessage());
                }
            }
            if (star != null) {
                sql += DaoProduct.getInstance().getProductByCategory("star", star, pagination);
                list.addAll(Arrays.asList(star));
            }
            if (highestLowest != null) {
                group = "";
                if (highestLowest[0].equals("DESC")) {
                    sql += DaoProduct.getInstance().getProductByCategory("highestPrice", highestLowest, pagination);
                }
                else{
                    sql += DaoProduct.getInstance().getProductByCategory("lowestPrice", highestLowest, pagination);
                }
            }

            String sqlAll = "SELECT DISTINCT product.id, brand, name, category, price, saleRate, product.Active, img FROM product INNER JOIN linkimg ON product.id=linkimg.id && linkimg.level=0 " + sql + group + limit;
            request.setAttribute("sql", sqlAll);
            listFilter = DaoProduct.getInstance().excQuery(list, pagination, sqlAll);
            System.out.println("SqlAll: "+sqlAll);
        }

        sqlAllCount += sql;
        totalNumberProduct = DaoProduct.getInstance().excQueryTotal(list, pagination, sqlAllCount);
        request.setAttribute("TotalNumberProduct", totalNumberProduct);
        request.setAttribute("pagination", pagination);
        request.setAttribute("categoryProduct", listFilter);

        request .getRequestDispatcher("category.jsp").forward(request, response);

    }

}