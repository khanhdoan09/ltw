package model;

public class Banner {

    private String id;
    private String urlImg;
    private String title;
    private String text;
    private String linkTo;
    private String type;

    // carousel product
    public Banner(String id, String urlImg) {
        this.id = id;
        this.urlImg = urlImg;
    }

    public Banner(String id, String urlImg, String text, String title, String linkTo) {
        this.id = id;
        this.urlImg = urlImg;
        this.title = title;
        this.text = text;
        this.linkTo = linkTo;
    }

    public String getId() {
        return id;
    }

    public String getUrlImg() {
        return urlImg;
    }

    public String getTitle() {
        return title;
    }

    public String getText() {
        return text;
    }

    public String getLinkTo() {
        return linkTo;
    }

    public String getType() {
        return type;
    }
}
