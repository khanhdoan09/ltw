package model;

public class Image {

    private String img;
    private int lelvel;
    private String color;

    public Image(String img, int lelvel, String color) {
        this.img = img;
        this.lelvel = lelvel;
        this.color = color;
    }

    public String getImg() {
        return img;
    }

    public int getLelvel() {
        return lelvel;
    }

    public String getColor() {
        return color;
    }
}
