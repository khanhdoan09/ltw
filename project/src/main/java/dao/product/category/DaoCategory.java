package dao.product.category;
import database.DatabaseConnection;
import beans.Category;
import java.util.List;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DaoCategory {
    private static DaoCategory instance = null;

    public static DaoCategory getInstance() {
        if (instance == null)
            instance = new DaoCategory();
        return instance;
    }
    private DaoCategory() {

    }

    Connection connect = DatabaseConnection.getConnection();


    public List<Category> getListCategory() {
        List<Category> re = new ArrayList<Category>();
        try {
            String sql = "SELECT * FROM category ";
            PreparedStatement s = connect.prepareStatement(sql);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                Category category = new Category(rs.getString("id"), rs.getString("name").toLowerCase(), rs.getString("gender"));
                re.add(category);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return re;
    }

    public List<Category> getListCategoryOnNav(String gender) {
        List<Category> re = new ArrayList<Category>();
        try {
            String sql = "SELECT * FROM category WHERE gender=?";
            PreparedStatement s = connect.prepareStatement(sql);
            s.setString(1, gender);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                Category category = new Category(rs.getString("id"), rs.getString("name").toLowerCase(), rs.getString("gender"));
                re.add(category);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return re;
    }

    public boolean addCategory(String name, String gender) {
        PreparedStatement s = null;
        String sql = "INSERT INTO category(name, gender) VALUES (?, ?)";
        try {
            s = connect.prepareStatement(sql);
            s.setString(1, name);
            s.setString(2, gender);
            s.toString();
            s.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return false;
    }

    public boolean editCategory(String id, String name, String gender) {
        PreparedStatement s = null;
        String sql = "UPDATE category SET name=?, gender=? WHERE id=?";
        try {
            s = connect.prepareStatement(sql);
            s.setString(1, name);
            s.setString(2, gender);
            s.setString(3, id);
            System.out.println(s.toString());
            s.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("xx"+e.getMessage());
        }
        return false;
    }

    public boolean removeCategory(String idCategory) {
        PreparedStatement s = null;
        String sql = "DELETE FROM category WHERE id=?";
        try {
            s = connect.prepareStatement(sql);
            s.setString(1, idCategory);
            s.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return false;
    }
}
