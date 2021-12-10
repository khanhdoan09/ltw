package khanhJava;

public class Product {
    private String id;
    private String brand;
    private String name;
    private String description;
    private double price;
    private double sale;
    private double saleRate;
    private double salePrice;
    private int starRate;
    private int totalValue;
    private int soleValue;
    private String date;

    public Product(String id, String brand, String name, String description, double price, double saleRate, double salePrice, int starRate, int totalValue, int soleValue, String date) {
        this.id = id;
        this.brand = brand;
        this.name = name;
        this.description = description;
        this.price = price;
        this.sale = sale;
        this.saleRate = saleRate;
        this.salePrice = salePrice;
        this.starRate = starRate;
        this.totalValue = totalValue;
        this.soleValue = soleValue;
        this.date = date;
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

    public String getDescription() {
        return description;
    }

    public double getPrice() {
        return price;
    }

    public double getSale() {
        return sale;
    }

    public double getSaleRate() {
        return saleRate;
    }

    public double getSalePrice() {
        return salePrice;
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

    public String getDate() {
        return date;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id='" + id + '\'' +
                ", brand='" + brand + '\'' +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", price=" + price +
                ", sale=" + sale +
                ", saleRate=" + saleRate +
                ", salePrice=" + salePrice +
                ", starRate=" + starRate +
                ", totalValue=" + totalValue +
                ", soleValue=" + soleValue +
                ", date='" + date + '\'' +
                '}';
    }
}
