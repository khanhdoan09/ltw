package service.customer.personal;

import dao.user.DaoCustomer;
import dao.user.DaoCustomerAddress;
import beans.AddressCustomer;
import beans.History;
import java.util.List;

public class PersonalAddressService {
    public boolean addAddress(String customerId, String city, String district, String ward, String description) {
        return DaoCustomerAddress.getInstance().addAddress(customerId,  city, district, ward, description);
    }

    public boolean deleteAddress(String idAddress, String idCustomer) {
        return DaoCustomerAddress.getInstance().deleteAddress(idAddress, idCustomer);
    }

    public boolean editAddress(String idCustomer, String idAddress, String idCity, String idDistrict, String idWard, String description) {
        return  DaoCustomerAddress.getInstance().editAddress(idCustomer, idAddress, idCity, idDistrict, idWard, description);
    }

    public List<AddressCustomer> getAddress(String idCustomer) {
        return DaoCustomerAddress.getInstance().getAddress(idCustomer);
    }

    public List<History> getHistoryPurchase(String idCustomer) {
        return DaoCustomer.getInstance().getHistoryPurchase(idCustomer);
    }
}
