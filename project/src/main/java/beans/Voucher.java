package beans;

import java.util.Date;

public class Voucher {
    private String id;
    private String from_date;
    private String to_date;
    private int discount;
    private String code;
    private int used;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getFrom_date() {
        return from_date;
    }

    public void setFrom_date(String from_date) {
        this.from_date = from_date;
    }

    public String getTo_date() {
        return to_date;
    }

    public void setTo_date(String to_date) {
        this.to_date = to_date;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public int getUsed() {
        return used;
    }

    public void setUsed(int used) {
        this.used = used;
    }

    public Voucher(String id, String from_date, String to_date, int discount) {
        this.id = id;
        this.from_date = from_date;
        this.to_date = to_date;
        this.discount = discount;
    }

    public Voucher(String id, String from_date, String to_date, int discount, String code, int used) {
        this.id = id;
        this.from_date = from_date;
        this.to_date = to_date;
        this.discount = discount;
        this.code = code;
        this.used = used;
    }

    public String isUsed() {
        if (this.used == 0) {
            return "Chưa sử dụng";
        }
        return "Đã sử dụng";
    }
}
