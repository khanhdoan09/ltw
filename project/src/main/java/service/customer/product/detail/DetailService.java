package service.customer.product.detail;

import beans.Product;
import beans.ProductHint;
import com.google.gson.Gson;
import dao.product.DaoProduct;
import dao.product.search.DaoSearchWithHint;

import java.util.List;

public class DetailService {
    public Product getDetail(String idProduct) {
        Product productDetail = DaoProduct.getInstance().getDetailProduct(idProduct);
        return productDetail;
    }

    public List<Product> getListHotProduct(String idProduct) {
        List<Product> listHotProduct = DaoProduct.getInstance().getListHotProduct(idProduct);
        return listHotProduct;
    }
}
