package service.customer.product.home;

import beans.Product;
import dao.product.DaoProduct;

import java.util.List;

public class HomeService {
    public List<Product> getListNewestProduct() {
        List<Product> listNewestProduct = DaoProduct.getInstance().getNewestProduct();
        return listNewestProduct;
    }

    public List<Product> getBestSaleProduct() {
        List<Product> listBestSaleProduct = DaoProduct.getInstance().getBestSale();
        return listBestSaleProduct;
    }

    public List<Product> getBestSellerProduct() {
        List<Product> listBestSellerProduct = DaoProduct.getInstance().getBestSeller();
        return listBestSellerProduct;
    }
}
