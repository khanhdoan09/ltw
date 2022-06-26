package service.customer.sign;

import dao.sign.SignInDao;
import dao.sign.SignUpDao;
import beans.User;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class SignUpService {
    private SignUpDao dao;
    public SignUpService() {
        dao = SignUpDao.getInstance();
    }
    public boolean checkEmailExist(String email){
        boolean validationFlag = dao.checkEmailExist(email);
        // email đã tồn tại
        if (!validationFlag) {
            return false;
        }
        return true;
    }

    public String createNewUser(String email, String password) {
        String encryptedPassword = encryptPassword(password);
        User user = new User(email, encryptedPassword);
        String userId = dao.createNewUser(user);
        return userId;
    }

    private String encryptPassword(String password) {
        String encryptPassword = null;
        try {
            MessageDigest m = MessageDigest.getInstance("MD5");
            m.update(password.getBytes());
            byte[] bytes = m.digest();
            StringBuilder s = new StringBuilder();
            for(int i=0; i< bytes.length ;i++)
            {
                s.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
            }
            encryptPassword = s.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return encryptPassword;
    }
}