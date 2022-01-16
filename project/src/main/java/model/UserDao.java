package model;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;

public class UserDao {
    static HashMap<String, User> map;
    private static  UserDao instance;

    public UserDao() {
        map = new HashMap<String, User>();
    }

    public static  void create(){

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
