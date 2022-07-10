package service.admin;

import java.util.ArrayList;
import java.util.List;
import beans.Product;
import dao.product.DaoProductAdmin;
import dao.product.detail.DaoProductDetail;

public class ProductAdminService {


    public String getSqlWithCondition(String attrProduct, String[] category) {
        List<Product> re = new ArrayList<Product>();
        String sql = "";
        if (attrProduct.equals("id")) {
            sql += " product.id=? || ";
        }
        if (attrProduct.equals("name")) {
            sql += "(";
            for (int i = 0; i < category.length; i++)
                sql += " product.name=? || ";
        }
        if (attrProduct.equals("brand")) {
            sql += "(";
            for (int i = 0; i < category.length; i++)
                sql += " brand=? || ";
        }
        else if (attrProduct.equals("size")) {
            sql += "(";
            for (int i = 0; i < category.length; i++)
                sql += " size=? || ";
        }
        else if (attrProduct.equals("underPrice")) {
            for (int i = 0; i < category.length; i++)
                sql += " price < ? || ";

        } else if (attrProduct.equals("upPrice")) {
            for (int i = 0; i < category.length; i++)
                sql += " price > ? || ";
        } else if (attrProduct.equals("fromToPrice")) {
            sql += " price BETWEEN ? AND ? || ";
        }
        else if (attrProduct.equals("highestPrice")){
            sql += " GROUP BY product.id ORDER BY price DESC    ";
        }
        else if (attrProduct.equals("lowestPrice")){
            sql += " GROUP BY product.id ORDER BY price ASC    ";
        }
        else if (attrProduct.equals("star")){
            sql += "(";
            for (int i = 0; i < category.length; i++)
                sql += " starRate=? || ";
        }
        else if (attrProduct.equals("searchInHeader")) {
            sql += "(";
            sql += "name LIKE ?     ";
        }
        sql = sql.substring(0, sql.length() - 4); // to remove ||
        if (!attrProduct.equals("highestPrice") && !attrProduct.equals("lowestPrice")){
            sql+=")";
        }
        return sql;
    }

    public List<Product> getListProduct(ArrayList<String> listParameterOfCondition, String sqlAll) {
        return DaoProductAdmin.getInstance().excQuery(listParameterOfCondition, sqlAll);
    }

    public int editProduct(String id, Product productDetail) {
        return  DaoProductAdmin.getInstance().editProduct(id, productDetail);
    }

    public Product getDetailProduct(String id) {
        return DaoProductDetail.getInstance().getDetailProduct(id);
    }



}
