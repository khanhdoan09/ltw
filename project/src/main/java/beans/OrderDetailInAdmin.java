package beans;

public class OrderDetailInAdmin {
    private String idOrder;
    private String idShoe;
    private int size;
    private String color;
    private int quantity;

    public OrderDetailInAdmin(String idOrder, String idShoe, int size, String color, int quantity) {
        this.idOrder = idOrder;
        this.idShoe = idShoe;
        this.size = size;
        this.color = color;
        this.quantity = quantity;
    }

    public String getIdOrder() {
        return idOrder;
    }

    public void setIdOrder(String idOrder) {
        this.idOrder = idOrder;
    }

    public String getIdShoe() {
        return idShoe;
    }

    public void setIdShoe(String idShoe) {
        this.idShoe = idShoe;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}