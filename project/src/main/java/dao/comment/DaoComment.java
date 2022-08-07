package dao.comment;

import beans.Comment;
import database.DatabaseConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DaoComment {
    private static DaoComment instance = null;

    public static DaoComment getInstance() {
        if (instance == null)
            instance = new DaoComment();
        return instance;
    }

    private DaoComment() {

    }

    Connection connect = DatabaseConnection.getConnection();
    public List<Comment> getListComment(String idProduct) {
        List<Comment> list = new ArrayList<Comment>();
        try {
            String sql = "SELECT  idComment,idProduct,content,dateComment,idUser FROM comment WHERE idProduct=?  AND idUser IN (SELECT id FROM user)";
            PreparedStatement s = connect.prepareStatement(sql);
            s.setString(1, idProduct);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                String idComment = rs.getString("idComment");
                String id_Product = rs.getString("idProduct");
                String content = rs.getString("content");
                String dateComment = rs.getString("dateComment");
                String idUser = rs.getString("idUser");

                list.add(new Comment(idComment,id_Product,content,idUser,dateComment));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public List<Comment> getListComment() {
        List<Comment> list = new ArrayList<Comment>();
        try {
            String sql = "SELECT  idComment,idProduct,content,dateComment,idUser FROM comment";
            PreparedStatement s = connect.prepareStatement(sql);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                String idComment = rs.getString("idComment");
                String id_Product = rs.getString("idProduct");
                String content = rs.getString("content");
                String dateComment = rs.getString("dateComment");
                String idUser = rs.getString("idUser");

                list.add(new Comment(idComment,id_Product,content,idUser,dateComment));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public String getNameUser(String idUser) {
        String name = "";
        try {
            String sql = "SELECT  name FROM user WHERE id=? ";
            PreparedStatement s = connect.prepareStatement(sql);
            s.setString(1, idUser);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                name = rs.getString("name");
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return name;
    }
    public void createNewComment(Comment comment) {
        try {
            String sql = "INSERT INTO comment(idProduct,content,idUser,dateComment) VALUES( ?, ?, ?, ?)";
            PreparedStatement s = connect.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
//            s.setString(1, comment.getIdComment());
            s.setString(1, comment.getIdProduct());
            s.setString(2, comment.getContent());
            s.setString(3, comment.getIdUser());
            s.setString(4, comment.getDateComment());
            s.executeUpdate();

            ResultSet rs = s.getGeneratedKeys();
            rs.next();
//            String idCommentNew = rs.getString(1);
//            return idCommentNew;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

    }

    public int getAmountComment(String idProduct) {
        int amount = 0;
        try {
            String sql = "SELECT  COUNT(idComment) FROM comment";
            PreparedStatement s = connect.prepareStatement(sql);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                amount = rs.getInt("COUNT(idComment)");
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return amount;
    }


}
