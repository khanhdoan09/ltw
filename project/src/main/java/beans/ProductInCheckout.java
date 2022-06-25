package beans;

public class ProductInCheckout {
    private String idProduct;
    private String name;
    private String color;
    private String size;
    private String urlImg;
    private int quantity;
    private double price;

    public ProductInCheckout(String idProduct, String name, String color, String size, String urlImg, int quantity, double price) {
        this.idProduct = idProduct;
        this.name = name;
        this.color = color;
        this.size = size;
        this.urlImg = urlImg;
        this.quantity = quantity;
        this.price = price;
    }

    public String getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(String idProduct) {
        this.idProduct = idProduct;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getUrlImg() {
        return urlImg;
    }

    public void setUrlImg(String urlImg) {
        this.urlImg = urlImg;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
