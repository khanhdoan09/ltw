package model;

public class ProductDetail {

   private String color;
   private int size;
   private int totalValue;
   private int soleValue;

    public ProductDetail(String color, int size, int totalValue, int soleValue) {
        this.color = color;
        this.size = size;
        this.totalValue = totalValue;
        this.soleValue = soleValue;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public int getTotalValue() {
        return totalValue;
    }

    public void setTotalValue(int totalValue) {
        this.totalValue = totalValue;
    }

    public int getSoleValue() {
        return soleValue;
    }

    public void setSoleValue(int soleValue) {
        this.soleValue = soleValue;
    }
}
