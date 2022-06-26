package service.customer.sign;

import dao.sign.SignInDao;
import beans.User;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class SignInService {
    private SignInDao dao;
    public SignInService() {
        dao = SignInDao.getInstance();
    }
    public boolean checkEmail(String email){
        boolean validationFlag = dao.checkEmail(email);
        // email sai
        if (!validationFlag) {
            return false;
        }
        return true;
    }

    public String checkPassword(String email, String password) {
        String encryptedPassword = encryptPassword(password);
        User user = new User(email, encryptedPassword);
        String userId = dao.checkPassword(user);
        // mật khẩu không đúng nên user id không có
        if (userId == null) {
            return null;
        }
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
