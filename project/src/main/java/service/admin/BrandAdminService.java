package service.admin;

import dao.product.brand.DaoProductBrand;

import beans.Brand;
import java.util.ArrayList;
import java.util.List;

public class BrandAdminService {

    public ArrayList<Brand> getBrands() {
        return DaoProductBrand.getInstance().getBrands();
    }

    public boolean deleteBrand(String idBrand) {
        return DaoProductBrand.getInstance().deleteBrand(idBrand);
    }
    public boolean updateNewNameBrand(String id, String newName) {
        return DaoProductBrand.getInstance().updateNewNameBrand(id, newName);
    }
    public  int saveANewBrand(String name, String img) {
        return DaoProductBrand.getInstance().saveANewBrand(name, img);
    }
}
