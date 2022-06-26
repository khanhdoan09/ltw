package beans;

public class User {
    private String id;
    private String email;
    private String password;
    private String name;
    private String phone;
    private String dob;
    private String gender;
    private String idAddress;
    private String isAdmin;
    private String idCart;
    private String avatar;
    private String createAt;
    private String updateAt;

    public User() {

    }
    public User(String id, String name, String email, String phoneNumber, String dob, String gender, String idAddress, int isAdmin, String createAt, String updateAt, String idCart, String avatar, String password) {
        this.id=id;
        this.name = name;
        this.email = email;
        this.phone = phoneNumber;
        this.dob = dob;
        this.gender = gender;
        this.idAddress = idAddress;
        this.isAdmin = String.valueOf(isAdmin);
        this.createAt = createAt;
        this.updateAt = updateAt;
        this.idCart = idCart;
        this.avatar = avatar;
        this.password = password;
    }
    public User(String email, String password){
        this.email = email;
        this.password = password;
    }

    public User(String name, String email, String phone, String dob, String gender, String idCart, String avatar) {
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.dob = dob;
        this.gender = gender;
        this.idCart = idCart;
        this.avatar = avatar;
    }


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getEmail(){
        return this.email;
    }
    public String getPassword(){
        return  this.password;
    }
    public void setPassword(String password){
         this.password = password;
    }
    public void setEmail(String email){
        this.email = email;
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

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getIdAddress() {
        return idAddress;
    }

    public void setIdAddress(String idAddress) {
        this.idAddress = idAddress;
    }

    public String getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(String isAdmin) {
        this.isAdmin = isAdmin;
    }

    public String getIdCart() {
        return idCart;
    }

    public void setIdCart(String idCart) {
        this.idCart = idCart;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }
}
