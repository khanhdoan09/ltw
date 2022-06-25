package beans;

public class ProductInCart {
    private String idCustomer;
    private String idProduct;
    private String colorShoe;
    private int quantityShoe;
    private int sizeShoe;
    private String name;
    private String brand;
    private double price;

    // for delete product in cart
    public ProductInCart(String idCustomer, String idProduct, String colorShoe, int sizeShoe ) {
        this.idCustomer = idCustomer;
        this.idProduct = idProduct;
        this.colorShoe = colorShoe;
        this.sizeShoe = sizeShoe;
    }
    // for get list product in cart
    public ProductInCart(String idCustomer, String idProduct, String colorShoe, int quantityShoe, int sizeShoe,String name, String brand, double price) {
        this.idCustomer = idCustomer;
        this.idProduct = idProduct;
        this.colorShoe = colorShoe;
        this.quantityShoe = quantityShoe;
        this.sizeShoe = sizeShoe;
        this.name = name;
        this.brand = brand;
        this.price = price;
    }

    public String getIdCustomer() {
        return idCustomer;
    }

    public void setIdCustomer(String idCustomer) {
        this.idCustomer = idCustomer;
    }

    public String getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(String idProduct) {
        this.idProduct = idProduct;
    }

    public String getColorShoe() {
        return colorShoe;
    }

    public void setColorShoe(String colorShoe) {
        this.colorShoe = colorShoe;
    }

    public int getQuantityShoe() {
        return quantityShoe;
    }

    public void setQuantityShoe(int quantity) {
        this.quantityShoe = quantity;
    }

    public int getSizeShoe() {
        return sizeShoe;
    }

    public void setSizeShoe(int size) {
        this.sizeShoe = size;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

}
