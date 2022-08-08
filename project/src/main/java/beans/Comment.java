package beans;

public class Comment {
    private String idComment;
    private String idProduct;
    private String content;
    private String idUser;
    private String dateComment;
    private String id_reply;

    public Comment() {

    }

    public Comment(String idComment, String idProduct, String content, String idUser, String dateComment)  {
        this.idComment= idComment;
        this.idProduct = idProduct;
        this.content = content;
        this.idUser =idUser;
        this.dateComment = dateComment;
    }

    public Comment( String idProduct, String content, String idUser, String dateComment)  {
        this.idProduct = idProduct;
        this.content = content;
        this.idUser =idUser;
        this.dateComment = dateComment;
    }



    public Comment(String idComment, String idProduct, String content, String idUser, String dateComment,String id_reply)  {
        this.idComment= idComment;
        this.idProduct = idProduct;
        this.content = content;
        this.idUser =idUser;
        this.dateComment = dateComment;
        this.id_reply = id_reply;
    }

    public String getIdComment() {
        return idComment;
    }

    public void setIdComment(String idComment) {
        this.idComment = idComment;
    }

    public String getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(String idProduct) {
        this.idProduct = idProduct;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getIdUser() {
        return idUser;
    }

    public void setIdUser(String idUser) {
        this.idUser = idUser;
    }

    public String getDateComment() {
        return dateComment;
    }

    public void setDateComment(String dateComment) {
        this.dateComment = dateComment;
    }

    public String getId_reply() {
        return id_reply;
    }

    public void setId_reply(String id_reply) {
        this.id_reply = id_reply;
    }
}
