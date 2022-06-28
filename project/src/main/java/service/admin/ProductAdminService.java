package service.admin;

import java.util.ArrayList;
import java.util.List;
import beans.Product;
import dao.product.DaoProductAdmin;

public class ProductAdminService {


    public String getSqlWithCondition(String attrProduct) {
        List<Product> re = new ArrayList<Product>();
        String sql = "";
        if (attrProduct.equals("id")) {
            sql += " product.id=? ";
        }
        if (attrProduct.equals("name")) {
            sql += " product.name=? ";
        }
        if (attrProduct.equals("brand")) {
            sql += " brand=? ";
        }
        return sql;
    }

    public List<Product> getListProduct(String parameterOfCondition, String sqlAll) {
        return DaoProductAdmin.getInstance().excQuery(parameterOfCondition, sqlAll);
    }


}
