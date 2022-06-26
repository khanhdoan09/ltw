package service.customer.product.search;

import beans.Product;
import dao.product.search.DaoSearchProduct;

import java.util.ArrayList;
import java.util.List;

public class SearchService {
    public String getSqlSearchWithCondition(String condition, String[] parameter) {
        String sql = "";
        if (condition.equals("id")) {
            sql += " product.id=? || ";
        }
        if (condition.equals("name")) {
            sql += "(";
            for (int i = 0; i < parameter.length; i++)
                sql += " product.name=? || ";
        }
        if (condition.equals("brand")) {
            sql += "(";
            for (int i = 0; i < parameter.length; i++)
                sql += " brand=? || ";
        }
        else if (condition.equals("size")) {
            sql += "(";
            for (int i = 0; i < parameter.length; i++)
                sql += " size=? || ";
        }
        else if (condition.equals("underPrice")) {
            for (int i = 0; i < parameter.length; i++)
                sql += " price < ? || ";

        } else if (condition.equals("upPrice")) {
            for (int i = 0; i < parameter.length; i++)
                sql += " price > ? || ";
        } else if (condition.equals("fromToPrice")) {
            sql += " price BETWEEN ? AND ? || ";
        }
        else if (condition.equals("highestPrice")){
            sql += " GROUP BY product.id ORDER BY price DESC    ";
        }
        else if (condition.equals("lowestPrice")){
            sql += " GROUP BY product.id ORDER BY price ASC    ";
        }
        else if (condition.equals("star")){
            sql += "(";
            for (int i = 0; i < parameter.length; i++)
                sql += " starRate=? || ";
        }
        else if (condition.equals("searchInHeader")) {
            sql += "(";
            sql += "name LIKE ?     ";
        }
        sql = sql.substring(0, sql.length() - 4); // to remove ||
        if (!condition.equals("highestPrice") && !condition.equals("lowestPrice")){
            sql+=")";
        }
        return sql;
    }

}
