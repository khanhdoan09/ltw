package service.admin;

import beans.OrderInAdmin;
import beans.OrderDetailInAdmin;
import dao.order.DaoOrderAdmin;

import java.util.List;

public class OrderAdminService {
    public List<OrderInAdmin> getListOrder(String sql) {
        return DaoOrderAdmin.getInstance().getListOrder(sql);
    }
    public List<OrderDetailInAdmin> getListOrderDetail(String idOrder) {
        return DaoOrderAdmin.getInstance().getListOrderDetail(idOrder);
    }
}
