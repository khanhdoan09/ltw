package model;

import databaseConnection.DatabaseConnection;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
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
}