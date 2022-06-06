package bean;

import java.io.Serializable;

public class AddressCustomer implements Serializable {
    private static final long serialVersionUID = 1L;

    private String city;
    private String district;
    private String ward;
    private String description;

    public AddressCustomer(String city, String district, String ward, String description) {
        this.city = city;
        this.district = district;
        this.ward = ward;
        this.description = description;
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

}
