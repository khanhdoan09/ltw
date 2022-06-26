package beans;

public class OrderInAdmin {

    private String id;
    private String idCustomer;
    private double total;
    private String createDate;
    private String status;


    public OrderInAdmin(String id, String idCustomer, double total, String createDate, String status) {
        this.id = id;
        this.idCustomer = idCustomer;
        this.total = total;
        this.createDate=createDate;
        this.status=status;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getIdCustomer() {
        return idCustomer;
    }

    public void setIdCustomer(String idCustomer) {
        this.idCustomer = idCustomer;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}