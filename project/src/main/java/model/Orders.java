package model;

public class Orders {
    private static Orders instance;

    private Orders() {

    }
    public static Orders getInstance() {
        if (instance == null ) {
            instance = new Orders();

        }
        return instance;
    }

    public void createOrder(Cart cart) {

    }

}
