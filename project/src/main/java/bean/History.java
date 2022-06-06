package bean;

import java.io.Serializable;

public class History implements Serializable {
    private static final long serialVersionUID = 1L;
    private String customerId;
    private String orderId;
    private String productName;
    private String orderStatus;
    private String productColor;
    private String avatar;
    private String createAt;
    private int productQuantity;
    private int productSize;
    private int productPrice;

    public History(String orderId, String productName, String orderStatus, String productColor, String avatar, String createAt, int productQuantity, int productSize, int productPrice) {
        this.customerId = customerId;
        this.orderId = orderId;
        this.productName = productName;
        this.orderStatus = orderStatus;
        this.productColor = productColor;
        this.avatar = avatar;
        this.createAt = createAt;
        this.productQuantity = productQuantity;
        this.productSize = productSize;
        this.productPrice = productPrice;
    }

    public String getCustomerId() {
        return customerId;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public String getProductColor() {
        return productColor;
    }

    public void setProductColor(String productColor) {
        this.productColor = productColor;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getCreateAt() {
        return createAt;
    }

    public void setCreateAt(String createAt) {
        this.createAt = createAt;
    }

    public int getProductQuantity() {
        return productQuantity;
    }

    public void setProductQuantity(int productQuantity) {
        this.productQuantity = productQuantity;
    }

    public int getProductSize() {
        return productSize;
    }

    public void setProductSize(int productSize) {
        this.productSize = productSize;
    }

    public int getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(int productPrice) {
        this.productPrice = productPrice;
    }
}
