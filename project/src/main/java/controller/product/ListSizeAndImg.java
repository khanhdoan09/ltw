package controller.product;

import dao.product.DaoProduct;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ListImg", value = "/ListSizeAndImg")
public class ListSizeAndImg extends HttpServlet {

    // dùng khi chọn màu khác của giày trong product.jsp
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
        List<Integer> listSize = DaoProduct.getInstance().getListSize(id, color);
        int remainProduct = DaoProduct.getInstance().getRemainProductDetail(id, color);
        String re = "";
        for (String str : listImg) {
            re+=str+"\n";
        }
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(toJson(listImg,mainImg, listSize, remainProduct));
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
