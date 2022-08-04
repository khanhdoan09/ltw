package dao.product.search;

import beans.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import database.DatabaseConnection;
import dao.product.brand.DaoProductBrand;

public class DaoSearchProduct {
    private static DaoSearchProduct instance = null;

    public static DaoSearchProduct getInstance() {
        if (instance == null)
            instance = new DaoSearchProduct();
        return instance;
    }
    Connection connect = DatabaseConnection.getConnection();

    private DaoSearchProduct() {

    }

    public List<Product> getListProduct(ArrayList<String> parameterOfCondition, String sql) {
        PreparedStatement s = null;
        List<Product> re = new ArrayList<Product>();
        try {
            s = connect.prepareStatement(sql);
            for (int i = 0; i < parameterOfCondition.size(); i++) {
                s.setString(i + 1, parameterOfCondition.get(i));
            }
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                String id = rs.getString("id");
                String idBrand = rs.getString("brand");
                String name = rs.getString("name");
                String categoryP = rs.getString("category");
                double price = rs.getDouble("price");
                int saleRate = rs.getInt("saleRate");
                int active = rs.getInt("Active");
                String avatar = rs.getString("img");
                String nameBrand = DaoProductBrand.getInstance().getNameBrand(idBrand);
                Product product = new Product(id, nameBrand, name, categoryP, price, saleRate, active, avatar);
                re.add(product);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("~~~ " + s.toString());
        }
        return re;
    }

}
