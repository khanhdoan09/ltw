package dao.product.search;

import beans.ProductHint;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import database.DatabaseConnection;

public class DaoSearchWithHint {
    private static DaoSearchWithHint instance = null;

    public static DaoSearchWithHint getInstance() {
        if (instance == null)
            instance = new DaoSearchWithHint();
        return instance;
    }
    Connection connect = DatabaseConnection.getConnection();

    private DaoSearchWithHint() {

    }
    public List<ProductHint> getDataFromWordInSearchHeader(String word) {
        List<ProductHint> re = new ArrayList<ProductHint>();
        PreparedStatement s = null;
        String sql = "SELECT DISTINCT name, id FROM product WHERE name LIKE ? GROUP BY name LIMIT 0, 10";
        try {
            s = connect.prepareStatement(sql);
            s.setString(1, "%"+word+"%");

            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                String id = rs.getString("id");
                String name = rs.getString("name");
                re.add(new ProductHint(id, name));
            }
        } catch (SQLException e) {
            System.out.println("~~~*** sql word search header" + sql);
        }
        return re;
    }
}
