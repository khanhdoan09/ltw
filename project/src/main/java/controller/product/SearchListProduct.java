package controller.product;

import dao.product.DaoProduct;
import beans.Product;
import dao.product.search.DaoCountProduct;
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

@WebServlet(name = "SearchListProduct", value = "/SearchListProduct")
public class SearchListProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SearchService searchService = new SearchService();
        int pagination = Integer.parseInt(request.getParameter("pagination").toString());

        List<Product> listProductResult = new ArrayList<Product>();
        int totalNumberProduct = 0;

        String group = " GROUP BY product.id ";
        String limit = " LIMIT 0,9 ";

        String[] category = request.getParameterValues("category");
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

        ArrayList<String> listParameterCondition = new ArrayList<String>();

        String[] searchInHeader = request.getParameterValues("nameProduct");
        String sql = "";
        String sqlCountProduct = "SELECT COUNT(product.id) FROM product ";

        // đã tìm bằng name rồi thì không tìm thể loại nên mới có if else bên dưới
            if (searchInHeader != null) {
                sql = " WHERE ";
                sql += searchService.getSqlSearchWithCondition("searchInHeader", searchInHeader);
                request.setAttribute("TypeCategory", "input-search-header");
                request.setAttribute("ValueCategory", searchInHeader[0]);
                searchInHeader[0] = "%"+searchInHeader[0]+"%";
                listParameterCondition.add(searchInHeader[0]);
            }
            else if (category != null) {
                request.setAttribute("TypeCategory", "category");
                request.setAttribute("ValueCategory", category[0]);
                sql = " WHERE category=?     ";
                listParameterCondition.addAll(Arrays.asList(category));
            }
            // category == null là do tìm kiếm bằng brand trên header
            else {
                sql = " WHERE 1 ";
                // để số 1 là do tí nữa sql = (&& brand=)
            }

            if (size != null) {
                sql = "JOIN product_detail ON product.id=product_detail.id " + sql +" && "+ searchService.getSqlSearchWithCondition("size", size) ;
                listParameterCondition.addAll(Arrays.asList(size));
            }
            if (brands != null) {
                sql +="&&"+ searchService.getSqlSearchWithCondition("brand", brands);
                listParameterCondition.addAll(Arrays.asList(brands));
            }
            if (underPrice != null) {
                sql +="&& ("+  searchService.getSqlSearchWithCondition("underPrice", underPrice);
                listParameterCondition.addAll(Arrays.asList(underPrice));
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
                sql += searchService.getSqlSearchWithCondition("fromToPrice", fromToPrice);
                listParameterCondition.addAll(Arrays.asList(fromToPrice));
            }
            if (upPrice != null) {
                if (sql.contains(" price ")) {
                    sql = sql.substring(0, sql.length()-1);
                    sql += " || ";
                }
                else {
                    sql += "&&(";
                }
                sql += searchService.getSqlSearchWithCondition("upPrice", upPrice);
                listParameterCondition.addAll(Arrays.asList(upPrice));
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
                    sql += searchService.getSqlSearchWithCondition("fromToPrice", fromToPrice);
                    listParameterCondition.addAll(Arrays.asList(fromToPrice));
                } catch (NumberFormatException e) {
                    request.setAttribute("errorInputPrice", e.getMessage());
                } catch (ArithmeticException e) {
                    request.setAttribute("errorInputPrice", e.getMessage());
                }
            }
            if (star != null) {
                sql += " && " + searchService.getSqlSearchWithCondition("star", star);
                listParameterCondition.addAll(Arrays.asList(star));
            }
            if (highestLowest != null) {
                group = ""; // reset group because of searchService.getSqlSearchWithCondition will set new group
                if (highestLowest[0].equals("DESC")) {
                    sql += searchService.getSqlSearchWithCondition("highestPrice", highestLowest);
                }
                else{
                    sql += searchService.getSqlSearchWithCondition("lowestPrice", highestLowest);
                }
            }

            String sqlAll = "SELECT DISTINCT product.id, brand, name, category, price, saleRate, product.Active, img FROM product INNER JOIN linkimg ON product.id=linkimg.id && linkimg.level=0 AND product.mainColor=linkimg.color " + sql + group + limit;
            listProductResult = DaoSearchProduct.getInstance().getListProduct(listParameterCondition, sqlAll);

        sqlCountProduct += sql;
        totalNumberProduct = DaoCountProduct.getInstance().getCountProduct(listParameterCondition, sqlCountProduct);

        request.setAttribute("totalNumberProduct", totalNumberProduct);
        request.setAttribute("pagination", pagination);
        request.setAttribute("categoryProduct", listProductResult);

        request.getRequestDispatcher("./views.customer/category.jsp").forward(request, response);

    }

}