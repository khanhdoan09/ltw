package beans;

public class HomeAdmin {
    private int countUser;
    private int countOrder;
    private int turnover;
    private int quantityProduct;
    private int qPDetail;
    private int countOrderOk;
    private  int sumPrice;
    private int countProductSale;
    private  int countBrand;
    private  int countComment;
    private  int countCategory;

    public HomeAdmin(int countUser, int countOrder, int turnover, int quantityProduct, int qPDetail, int countOrderOk, int sumPrice, int countProductSale, int countBrand, int countComment, int countCategory) {
        this.countUser = countUser;
        this.countOrder = countOrder;
        this.turnover = turnover;
        this.quantityProduct = quantityProduct;
        this.qPDetail = qPDetail;
        this.countOrderOk = countOrderOk;
        this.sumPrice = sumPrice;
        this.countProductSale = countProductSale;
        this.countBrand = countBrand;
        this.countComment = countComment;
        this.countCategory = countCategory;
    }
    public void setCountUser(int countUser) {
        this.countUser = countUser;
    }

    public void setCountOrder(int countOrder) {
        this.countOrder = countOrder;
    }

    public void setTurnover(int turnover) {
        this.turnover = turnover;
    }

    public void setQuantityProduct(int quantityProduct) {
        this.quantityProduct = quantityProduct;
    }

    public void setqPDetail(int qPDetail) {
        this.qPDetail = qPDetail;
    }

    public void setCountOrderOk(int countOrderOk) {
        this.countOrderOk = countOrderOk;
    }

    public void setSumPrice(int sumPrice) {
        this.sumPrice = sumPrice;
    }

    public void setCountProductSale(int countProductSale) {
        this.countProductSale = countProductSale;
    }

    public void setCountBrand(int countBrand) {
        this.countBrand = countBrand;
    }

    public void setCountComment(int countComment) {
        this.countComment = countComment;
    }

    public void setCountCategory(int countCategory) {
        this.countCategory = countCategory;
    }

    public int getCountUser() {
        return countUser;
    }

    public int getCountOrder() {
        return countOrder;
    }

    public int getTurnover() {
        return turnover;
    }

    public int getQuantityProduct() {
        return quantityProduct;
    }

    public int getqPDetail() {
        return qPDetail;
    }

    public int getCountOrderOk() {
        return countOrderOk;
    }

    public int getSumPrice() {
        return sumPrice;
    }

    public int getCountProductSale() {
        return countProductSale;
    }

    public int getCountBrand() {
        return countBrand;
    }

    public int getCountComment() {
        return countComment;
    }

    public int getCountCategory() {
        return countCategory;
    }



}
