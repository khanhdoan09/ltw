package model;

import java.util.HashMap;

public class UserDao {
    static HashMap<String, User> map;
    public static  UserDao instance;

    private UserDao() {

    }

    public static  void create(){

    }

    static {
        map = new HashMap<String, User>();
        getData();
    }
    public static UserDao  getInstance(){

        if (instance == null){
            instance = new UserDao();
        }
        return  instance;
    }
    public static HashMap<String, User> getData(){
       map.put("01", new User("19130034@gmail.com","12345"));
       map.put("02",new User("19130035@mail.com","12345"));
       return map;
    }
    public static boolean login(User user){
        return map.get("01").getEmail().equals(user.getEmail()) || map.get("01").getPassword().equals(user.getPassword());
    }
}
