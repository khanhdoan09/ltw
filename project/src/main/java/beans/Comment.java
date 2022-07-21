package beans;

public class Comment {
    private String idComment;
    private String idProduct;
    private String content;
    private String idUser;
    private String dateComment;

    public Comment(String idComment, String idProduct, String content, String idUser, String dateComment)  {
        this.idComment= idComment;
        this.idProduct = idProduct;
        this.content = content;
        this.idUser =idUser;
        this.dateComment = dateComment;
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
}
