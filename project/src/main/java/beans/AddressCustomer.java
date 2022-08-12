package beans;

import java.io.Serializable;

public class AddressCustomer implements Serializable {
    private static final long serialVersionUID = 1L;

    private String id;
    private String city;
    private String district;
    private String ward;
    private String description;
    private String isTemporary;
    private String name;
    private String phone;
    private String email;
    private String idCustomer;

    public AddressCustomer(String id, String city, String district, String ward, String description) {
        this.id = id;
        this.city = city;
        this.district = district;
        this.ward = ward;
        this.description = description;
    }

    public String getIdCustomer() {
        return idCustomer;
    }

    public void setIdCustomer(String idCustomer) {
        this.idCustomer = idCustomer;
    }


    // dùng lúc khách hàng nhập địa chỉ tạm thời khi thanh toán

    public AddressCustomer(String city, String district, String ward, String description, String isTemporary, String name, String phone, String email, String idCustomer) {
        this.city = city;
        this.district = district;
        this.ward = ward;
        this.description = description;
        this.isTemporary = isTemporary;
        this.name = name;
        this.phone = phone;
        this.email = email;
        this.idCustomer = idCustomer;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String isTemporary() {
        return isTemporary;
    }

    public void setTemporary(String temporary) {
        this.isTemporary = temporary;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getWard() {
        return ward;
    }

    public void setWard(String ward) {
        this.ward = ward;
    }

    @Override
    public String toString() {
        return "AddressCustomer{" +
                "id='" + id + '\'' +
                ", city='" + city + '\'' +
                ", district='" + district + '\'' +
                ", ward='" + ward + '\'' +
                ", description='" + description + '\'' +
                ", isTemporary='" + isTemporary + '\'' +
                ", name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", idCustomer='" + idCustomer + '\'' +
                '}';
    }
}
