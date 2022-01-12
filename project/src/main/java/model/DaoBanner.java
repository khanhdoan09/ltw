package model;

import databaseConnection.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoBanner {

    private static DaoBanner instance = null;
    Connection connect = DatabaseConnection.getConnection();


    public static DaoBanner getInstance() {
        if (instance == null)
            instance = new DaoBanner();
        return instance;
    }

    private DaoBanner() {
    }

    public List<Banner> getCarouselCategory(String type) {
        List<Banner> re = new ArrayList<Banner>();
        try {
            String sql = "SELECT id, urlImg FROM banner WHERE type=?";
            PreparedStatement s = connect.prepareStatement(sql);
            s.setString(1, type);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                String id = rs.getString("id");
                String urlImg = rs.getString("urlImg");
                Banner banner = new Banner(id, urlImg);
                re.add(banner);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return re;
    }

    public List<Banner> getIntroCategory(String type) {
        List<Banner> re = new ArrayList<Banner>();
        try {
            String sql = "SELECT id, urlImg,text, title, linkTo FROM banner WHERE type=?";
            PreparedStatement s = connect.prepareStatement(sql);
            s.setString(1, type);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                String id = rs.getString("id");
                String urlImg = rs.getString("urlImg");
                String text = rs.getString("text");
                String title = rs.getString("title");
                String linkTo = rs.getString("linkTo");
                Banner banner = new Banner(id, urlImg, text, title, linkTo);
                re.add(banner);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return re;
    }

}
