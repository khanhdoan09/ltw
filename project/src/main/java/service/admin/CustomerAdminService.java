package service.admin;

import beans.User;
import dao.user.DaoUserAdmin;

import java.util.List;

public class CustomerAdminService {
    public List<User> getListUser() {
        return DaoUserAdmin.getInstance().getListUser();
    }
}
