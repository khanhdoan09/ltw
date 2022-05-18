package controller;

import model.DaoProduct;
import model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "SearchListProduct", value = "/SearchListProduct")
public class SearchListProduct extends HttpServlet {
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
        int totalNumberProduct = 0;

        String group = " GROUP BY product.id ";
        String limit = " LIMIT 0,9 ";

        String categoryGender = request.getParameter("categoryGender");
        String[] categoriesByOnNav = request.getParameterValues("categoryOnNav");
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
                sql = "  WHERE ";
                sql += DaoProduct.getInstance().getProductByCategory("searchInHeader", searchInHeader);
                request.setAttribute("TypeCategory", "input-search-header");
                request.setAttribute("ValueCategory", searchInHeader[0]);
                searchInHeader[0] = "%"+searchInHeader[0]+"%";
                list.add(searchInHeader[0]);
            }
            else if (categoryT != null) {
                request.setAttribute("TypeCategory", "category");
                request.setAttribute("ValueCategory", categoryT[0]);
                sql = " WHERE category=?     ";
                list.addAll(Arrays.asList(categoryT));
            }
            else if (categoryT == null) { // luc nay la tim kiem bang brand tren navigation
                request.setAttribute("TypeCategory", "brand");
                request.setAttribute("ValueCategory", brandT);
                sql = " WHERE ";
            }
            if (size != null) {
                String s = "\\";
                int t = s.lastIndexOf("\\",1);
                sql = "JOIN product_detail ON product.id=product_detail.id " + sql +"&&"+ DaoProduct.getInstance().getProductByCategory("size", size) ;
                list.addAll(Arrays.asList(size));
                System.out.println(size[0]);
            }
            if (brands != null) {
                sql +="&&"+ DaoProduct.getInstance().getProductByCategory("brand", brands);
                list.addAll(Arrays.asList(brands));
            }
            if (underPrice != null) {
                sql +="&& ("+  DaoProduct.getInstance().getProductByCategory("underPrice", underPrice);
                list.addAll(Arrays.asList(underPrice));
            }
            if (fromPrice != null && toPrice != null) {
                String[] fromToPrice = {fromPrice[0], toPrice[0]};
                if (sql.contains(" price ")) {
                    sql = sql.substring(0, sql.length()-1);
                    sql += " || ";
                }
                else {
                    sql += "&&(";
                }
                sql += DaoProduct.getInstance().getProductByCategory("fromToPrice", fromToPrice);
                list.addAll(Arrays.asList(fromToPrice));
            }
            if (upPrice != null) {
                if (sql.contains(" price ")) {
                    sql = sql.substring(0, sql.length()-1);
                    sql += " || ";

                }
                else {
                    sql += "&&(";
                }
                sql += DaoProduct.getInstance().getProductByCategory("upPrice", upPrice);
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
                    sql += DaoProduct.getInstance().getProductByCategory("fromToPrice", fromToPrice);
                    list.addAll(Arrays.asList(fromToPrice));
                } catch (NumberFormatException e) {
                    request.setAttribute("errorInputPrice", e.getMessage());
                } catch (ArithmeticException e) {
                    request.setAttribute("errorInputPrice", e.getMessage());
                }
            }
            if (star != null) {
                sql += "&&"+DaoProduct.getInstance().getProductByCategory("star", star);
                list.addAll(Arrays.asList(star));
            }
            if (highestLowest != null) {
                group = "";
                if (highestLowest[0].equals("DESC")) {
                    sql += ""+DaoProduct.getInstance().getProductByCategory("highestPrice", highestLowest);
                }
                else{
                    sql +=""+ DaoProduct.getInstance().getProductByCategory("lowestPrice", highestLowest);
                }
            }

            System.out.println("####"+sql);
            System.out.println("@@@@@"+sql);

            String sqlAll = "SELECT DISTINCT product.id, brand, name, category, price, saleRate, product.Active, img FROM product INNER JOIN linkimg ON product.id=linkimg.id && linkimg.level=0 AND product.mainColor=linkimg.color " + sql + group + limit;
            listFilter = DaoProduct.getInstance().excQuery(list, sqlAll);
            System.out.println("SqlAll: "+sqlAll);
        }

        sqlAllCount += sql;
        totalNumberProduct = DaoProduct.getInstance().excQueryTotal(list,  sqlAllCount);
        request.setAttribute("TotalNumberProduct", totalNumberProduct);
        request.setAttribute("pagination", pagination);
        request.setAttribute("categoryProduct", listFilter);

//        request.getRequestDispatcher("category.jsp").forward(request, response);
        System.out.println("done");
        request.getRequestDispatcher("./views.customer/category.jsp").forward(request, response);

    }

}