package dao.product.image;

import connection.DatabaseConnection;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoProductImage {
    private static DaoProductImage instance = null;

    public static DaoProductImage getInstance() {
        if (instance == null)
            instance = new DaoProductImage();
        return instance;
    }
    private DaoProductImage() {

    }
    Connection connect = DatabaseConnection.getConnection();

    public boolean deleteImg(HttpServletRequest request, String id, String img) {
        File productDir = new File(request.getServletContext().getAttribute("FILES_DIR") + File.separator + "product");
        if (!productDir.exists()) {
            productDir.mkdirs();
        }


        PreparedStatement s1 = null;
        String sql1 = "DELETE FROM linkimg WHERE id=? && img=?";
        PreparedStatement s2 = null;
        String sql2 = "SELECT * FROM linkimg WHERE id=? && img=?";
        try {
            s2 = connect.prepareStatement(sql2);
            s2.setString(1, id);
            s2.setString(2, img);
            System.out.println("~"+s2.toString());
            ResultSet rs = s2.executeQuery();
            while (rs.next()) {
                String src = rs.getString("img");
                System.out.println("~"+src);
                File file = new File(productDir.getAbsolutePath() + File.separator + src+".jpg");
                System.out.println(file.getAbsolutePath());
                if (file.exists()) {
                    System.out.println("Deleted the file: " + file.getName());
                } else {
                    System.out.println("Failed to delete the file.");
                }

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }


        try {
            s1 = connect.prepareStatement(sql1);
            s1.setString(1, id);
            s1.setString(2, img);
            s1.executeUpdate();
            return true;
        } catch (SQLException e) {
            return false;
        }
    }

    public boolean saveImg(String id, String img, int level, String color) {
        PreparedStatement s = null;
        String sql = "INSERT INTO linkimg VALUES(?, ?, ?, ?)";
        try {
            s = connect.prepareStatement(sql);
            s.setString(1, id);
            s.setString(2, img);
            s.setInt(3, level);
            s.setString(4, color);
            System.out.println(s.toString());
            s.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public boolean setImgToMain(String img, String id, String color) {
        PreparedStatement s1 = null;
        String sql1 = "UPDATE linkimg SET level=1 WHERE id=? AND color=?";
        PreparedStatement s2 = null;
        String sql2 = "UPDATE linkimg SET level=0 WHERE id=? AND img=? AND color=?";
        try {
            // 1. set all not to main
            s1 = connect.prepareStatement(sql1);
            s1.setString(1, id);
            s1.setString(2, color);
            s1.executeUpdate();
            // 1. set one to main
            s2 = connect.prepareStatement(sql2);
            s2.setString(1, id);
            s2.setString(2, img);
            s2.setString(3, color);
            s2.executeUpdate();
            System.out.println("oke");
            return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return false;
    }
    public boolean changeLevelImg(String img,String color, String id) {
        PreparedStatement s2 = null;
        String sql2 = "UPDATE linkimg SET level=1 WHERE id=? AND color=?";
        PreparedStatement s = null;
        String sql = "UPDATE linkimg SET level=0 WHERE id=? AND img=?";
        try {
            s2 = connect.prepareStatement(sql2);
            s2.setString(1, id);
            s2.setString(2, color);
            s2.executeUpdate();

            s = connect.prepareStatement(sql);
            s.setString(1, id);
            s.setString(2, img);
            s.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return false;
    }

    public List<beans.Image> getListImg(String id) {
        List<beans.Image> list = new ArrayList<beans.Image>();
        // get list size
        try {
            // main img
            String sql = "SELECT img,level,color FROM product JOIN linkimg ON product.id=linkimg.id WHERE product.id=? ";
            PreparedStatement s = connect.prepareStatement(sql);
            s.setString(1, id);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                String img = rs.getString("img");
                int level = rs.getInt("level");
                String color = rs.getString("color");
                list.add(new beans.Image(img, level, color));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return list;   }


}
