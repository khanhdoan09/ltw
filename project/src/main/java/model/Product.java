package model;

import java.util.List;

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
    private List<Integer> listSize;
    private String avatar;
    private ImgProduct img;
    private int quantitySold;
    private int quantity = totalValue - soleValue;

//cart
    public Product(String id, String brand, String name, String category, double price, double saleRate,int starRate, String description,int totalValue, int soleValue, int active,String avatar) {
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
        this.avatar= avatar;
    }


    // detail
    public Product(String id, String brand, String name, String category, double price, double saleRate,int starRate, String description,int totalValue, int soleValue, int active, List<Integer> listSize, ImgProduct img) {
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
        this.listSize = listSize;
        this.img = img;
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


    // list
    public Product(String id, String brand, String name, String category, double price, double saleRate, int active, String avatar) {
        this.id = id;
        this.brand = brand;
        this.name = name;
        this.category = category;
        this.price = price;
        this.saleRate = saleRate;
        this.active = active;
        this.avatar = avatar;
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


    public List<Integer> getListSize() {return listSize;}
    public String getAvatar() {return avatar;}
    public ImgProduct getImg() {return img;}
    public int getQuantity() {
        return quantity;
    }
    public int getQuantitySold() {
        return quantitySold;
    }
    public void setQuantitySold(int quantitySold) {
        if(quantity >= quantitySold && quantitySold > 0)
            this.quantitySold = quantitySold;
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
        return quantitySold * (price-(price*saleRate/100));
    }
}
