package service.customer.personal;
import beans.User;
import dao.user.DaoCustomer;

public class PersonalCustomerService {
    public User getUser(String id) {
        return DaoCustomer.getInstance().getUser(id);
    }

    public boolean updateInfo(String idCustomer, String name, String email, String phone, String gender) {
        return DaoCustomer.getInstance().updateInfo(idCustomer, name, email, phone, gender);
    }

    public boolean checkOldPasswordToChange(String idCustomer, String oldPassword) {
        return DaoCustomer.getInstance().checkOldPasswordToChange(idCustomer, oldPassword);
    }

    public boolean changePassword(String idCustomer, String newPassword) {
        return DaoCustomer.getInstance().changePassword(idCustomer, newPassword);
    }
}