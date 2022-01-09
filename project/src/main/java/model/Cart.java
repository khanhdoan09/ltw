package model;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

public class Cart {
    private Map<String , Product> data;
    private static Cart instance;
    private Cart() {
        data = new HashMap<>();
    }

    public static Cart getInstance() {
        if(instance ==null) {
            instance = new Cart();
        }
        return instance;
    }
//get product by id
    public Product get(String id) {
        return data.get(id);
    }
//    put product to cart
    public void put(Product product){
        data.put(product.getId(), product);
    }
//    remove product from cart
    public void remove(String id){
        data.remove(id);
    }
//    get total price
    public double total(){
        double total =0;
        for(Product p : data.values()){
            total += p.gettotal();
        }
        return total;
    }
//    get total quantity
    public int quantity(){
        int quantity = 0;
        for(Product p : data.values()) {
            quantity += p.getSoleValue();
        }
        return  quantity;
    }
//    get list product
    public Collection<Product> getData() {
        put(new Product("01","Adidas","adidas x James Bond Ultraboost SUMMER.RDY","Running Man", 65.5,16,4));
        put(new Product("02","Nike","Nike Downshifter 9","Running Man", 79.5,20,4));
        return data.values();
    }
}
