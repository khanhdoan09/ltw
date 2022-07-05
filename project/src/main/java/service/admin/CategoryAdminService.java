package service.admin;
import beans.Category;
import dao.product.category.DaoCategory;
import java.util.List;

public class CategoryAdminService {

    public List<Category> getListCategory() {
        List<Category> re = DaoCategory.getInstance().getListCategory();
        return re;
    }

    public boolean addCategory(String name, String gender) {
        return DaoCategory.getInstance().addCategory(name, gender);
    }
    public boolean editCategory(String id, String name, String gender) {
        return DaoCategory.getInstance().editCategory(id, name, gender);
    }
    public boolean removeCategory(String id) {
        return DaoCategory.getInstance().removeCategory(id);
    }
}
