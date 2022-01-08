package model;

public class Product {
    private String id;
    private String brand;
    private String name;
    private String category;
    private double price;
    private double saleRate;
    private int starRate;
    private int totalValue;
    private int soleValue;
    private String create_at;
    private String update_at;
    private String description;
    private String idVoucher;
    private int active;

    // detail
    public Product(String id, String brand, String name, String category, double price, double saleRate,int starRate, String description,int totalValue, int soleValue, int active) {
        this.id = id;
        this.brand = brand;
        this.name = name;
        this.category = category;
        this.price = price;
        this.saleRate = saleRate;
        this.starRate = starRate;
        this.description = description;
        this.totalValue = totalValue;
        this.soleValue = soleValue;
        this.active = active;
    }
    // list
    public Product(String id, String brand, String name, String category, double price, double saleRate, int active) {
        this.id = id;
        this.brand = brand;
        this.name = name;
        this.category = category;
        this.price = price;
        this.saleRate = saleRate;
        this.active = active;
    }

    // search in header
    public Product (String id, String name) {
        this.id = id;
        this.name = name;
    }

    public Product(String id, String brand, String name, String category, double price, double saleRate, int starRate, int totalValue, int soleValue, String create_at, String update_at, String description, String idVoucher, int active) {
        this.id = id;
        this.brand = brand;
        this.name = name;
        this.category = category;
        this.price = price;
        this.saleRate = saleRate;
        this.starRate = starRate;
        this.totalValue = totalValue;
        this.soleValue = soleValue;
        this.create_at = create_at;
        this.update_at = update_at;
        this.description = description;
        this.idVoucher = idVoucher;
        this.active = active;
    }

    public String getId() {
        return id;
    }

    public String getBrand() {
        return brand;
    }

    public String getName() {
        return name;
    }

    public String getCategory() {
        return category;
    }

    public double getPrice() {
        return price;
    }

    public double getSaleRate() {
        return saleRate;
    }

    public int getStarRate() {
        return starRate;
    }

    public int getTotalValue() {
        return totalValue;
    }

    public int getSoleValue() {
        return soleValue;
    }

    public String getCreate_at() {
        return create_at;
    }

    public String getUpdate_at() {
        return update_at;
    }

    public String getDescription() {
        return description;
    }

    public String getIdVoucher() {
        return idVoucher;
    }

    public int getActive() {
        return active;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id='" + id + '\'' +
                ", brand='" + brand + '\'' +
                ", name='" + name + '\'' +
                ", category='" + category + '\'' +
                ", price=" + price +
                ", saleRate=" + saleRate +
                ", starRate=" + starRate +
                ", totalValue=" + totalValue +
                ", soleValue=" + soleValue +
                ", craete_at='" + create_at + '\'' +
                ", update_at='" + update_at + '\'' +
                ", description='" + description + '\'' +
                ", idVoucher='" + idVoucher + '\'' +
                ", active=" + active +
                '}';
    }

    public double gettotal() {
        return soleValue * (price-(price*saleRate/100));
    }
}
