package model;

import model.Admin.DaoProductAdmin;

import java.util.ArrayList;
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
    private List<ProductDetail> detail;
    private String avatar;
    private ImgProduct img;
    private int quantitySold = 1;
    private int quantity ;
    private String mainColor;
    //admin
    private List<Image>listImg;

    public Product() {

    }

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
    public Product(String id, String brand, String name, String category, double price, double saleRate, int starRate, String description, int totalValue, int soleValue, int active, List<ProductDetail> detail, String create_at, ImgProduct img, String mainColor) {
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
        this.detail=detail;
        this.create_at=create_at;
        this.img = img;
        this.mainColor = mainColor;
    }

    // detail
    public Product(String id, String brand, String name, String category, double price, double saleRate, int starRate, String description, int totalValue, int soleValue, int active, List<ProductDetail> detail, String create_at, List<Image> img) {
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
        this.detail = detail;
        this.create_at=create_at;
        this.listImg = img;
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
        String[] date = create_at.split("\\W");
        if (date[0].length()==1)
            date[0]="0"+date[0];
        if (date[1].length()==1)
            date[1]="0"+date[1];
        return date[2]+"-"+date[1]+"-"+date[0];
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

    public List<ProductDetail> getDetail() {
        return detail;
    }

    public void setDetail(List<ProductDetail> detail) {
        this.detail = detail;
    }

    public int getActive() {
        return active;
    }


    public String getAvatar() {return avatar;}
    public ImgProduct getImg() {return img;}
    public int getQuantity() {
        return getTotalValue() - getSoleValue();
    }
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getQuantitySold() {
        return quantitySold;
    }

    public void setQuantitySold(int quantitySold) {
        if(getQuantity() >= quantitySold && quantitySold > 0)
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

    public double getSalePrice() {
        return (price-(price*saleRate/100));
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setSaleRate(double saleRate) {
        this.saleRate = saleRate;
    }

    public void setStarRate(int starRate) {
        this.starRate = starRate;
    }

    public void setTotalValue(int totalValue) {
        this.totalValue = totalValue;
    }

    public void setSoleValue(int soleValue) {
        this.soleValue = soleValue;
    }

    public void setCreate_at(String create_at) {
        this.create_at = create_at;
    }

    public void setUpdate_at(String update_at) {
        this.update_at = update_at;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setIdVoucher(String idVoucher) {
        this.idVoucher = idVoucher;
    }

    public void setActive(int active) {
        this.active = active;
    }


    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public void setImg(ImgProduct img) {
        this.img = img;
    }

    public List<Integer> getListSize(String color) {
        return DaoProduct.getInstance().getListSize(this.id, color);
    }

    public String getMainImg(String color) {
        return  DaoProduct.getInstance().getMainImg(this.id, color);
    }
    public List<String> getListSubImg(String color){
        return DaoProduct.getInstance().getListSubImg(this.getId(), color);
    }

    public List<String> getListColor() {
        return DaoProductAdmin.getInstance().getListColor(this.getId());
    }

    public String getMainColor() {return this.mainColor;}

    // use in admin page
    public String toJson() { String re = "{"; re += "\"id\":\""+this.id+"\","; re += "\"name\":\""+this.name+"\","; re += "\"brand\":\""+this.brand+"\","; re += "\"value\":\""+this.totalValue+"\","; re += "\"saleRate\":\""+this.saleRate+"\""; re +="}"; return re; }

    public List<Image> getListImg() {
        return listImg;
    }
    public void setListImg(List<Image>list){
        this.listImg=list;
    }
}
