package controller;

import model.Dao;
import model.DaoProduct;
import model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ListImg", value = "/ListImg")
public class ListImg extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String color = request.getParameter("color");
        List<String> listImg= DaoProduct.getInstance().getListSubImg(id, color);
        String mainImg = DaoProduct.getInstance().getMainImg(id, color);
        List<Integer> listColor = DaoProduct.getInstance().getListSize(id, color);
        int remainProduct = DaoProduct.getInstance().getRemainProductDetail(id, color);
        String re = "";
        for (String str : listImg) {
            re+=str+"\n";
        }
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(toJson(listImg,mainImg, listColor, remainProduct));
    }

    public String toJson(List<String> listImg, String mainImg, List<Integer> listSize, int remainProduct) {
        String re="{";
        re+="\"listImg\":[";
        for (String str : listImg) {
            re+="\""+str+"\",";
        }
        re=re.substring(0, re.length()-1);
        re+="],";
        re+="\"listSize\":[";
        for (Integer size : listSize) {
            re+="\""+size+"\",";
        }
        re=re.substring(0, re.length()-1);
        re+="],";
        re+="\"mainImg\":\""+mainImg+"\",";
        re+="\"remain\":\""+remainProduct+"\"";
        re+="}";
        return re;
    }

}
