package dao.comment;

import beans.Comment;
import database.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class DaoComment2 {
    private static DaoComment2 instance = null;

    public static DaoComment2 getInstance() {
        if (instance == null)
            instance = new DaoComment2();
        return instance;
    }

    private DaoComment2() {

    }

    Connection connect = DatabaseConnection.getConnection();

    public List<Comment> checkComment(String idComment) {
        List<Comment> result = new ArrayList<Comment>();
        try {
            String sql = "SELECT idComment,idProduct,content,dateComment,idUser,id_reply FROM comment WHERE id_reply = ?";
            PreparedStatement s = connect.prepareStatement(sql);
            s.setString(1, idComment);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                String id = rs.getString("idComment");
                String id_Product = rs.getString("idProduct");
                String content = rs.getString("content");
                String dateComment = rs.getString("dateComment");
                String idUser = rs.getString("idUser");
                String id_reply = rs.getString("id_reply");

                result.add(new Comment(id,id_Product,content,idUser,dateComment,id_reply));
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return result;
    }

    public String getUserName(String idComment) {
        String name = "";
        try {
            String sql = "SELECT name FROM user WHERE id IN (SELECT idUser FROM comment WHERE idComment=?)";
            PreparedStatement s = connect.prepareStatement(sql);
            s.setString(1, idComment);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                name = rs.getString("name");
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return name;
    }
}
