package dao.product.image;

import database.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DaoLinkImage {
    private static DaoLinkImage instance = null;


    public static DaoLinkImage getInstance() {
        if (instance == null)
            instance = new DaoLinkImage();
        return instance;
    }

    private DaoLinkImage() {

    }

    Connection connect = DatabaseConnection.getConnection();

    private Map<String, ArrayList<String>> mapLinkImg = new HashMap<String, ArrayList<String>>();

    public Map<String, ArrayList<String>> getAll() {
        Connection connect = DatabaseConnection.getConnection();
        try {
            Statement s = connect.createStatement();
            ResultSet rs = s.executeQuery("SELECT * FROM linkimg");
            while (rs.next()) {
                String id = rs.getString(1);
                String link = rs.getString(2);
                if (mapLinkImg.containsKey(id)) {
                    ArrayList<String> tmp  = mapLinkImg.get(id);
                    tmp.add(link);
                    mapLinkImg.put(id, tmp);
                }
                else {
                    ArrayList<String> tmp  =new ArrayList<String>();
                    tmp.add(link);
                    mapLinkImg.put(id, tmp);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return mapLinkImg;
    }

    public String getAvatar(String idProduct) {
        String re = "";
        // get list size
        try {
            // main img
            String sql = "SELECT img FROM product JOIN linkimg ON product.id=linkimg.idProduct WHERE product.id=? and level=0";
            PreparedStatement s = connect.prepareStatement(sql);
            s.setString(1, idProduct);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                String img = rs.getString("img");
                return img;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return re;
    }


}