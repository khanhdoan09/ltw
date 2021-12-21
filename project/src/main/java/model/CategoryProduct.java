package model;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CategoryProduct", value = "/CategoryProduct")
public class CategoryProduct extends HttpServlet {
    private int pagination = 1;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String a = request.getParameter("category");
        String b = request.getParameter("categoryGender");
        String category = a + b;
        System.out.println(category);
        List<Product> listFilter = new ArrayList<Product>();
        String folderImage = "";
        if (category.equals("SlidesMan")) {
            listFilter = DaoProduct.getInstance().getProductByCategory("Slides Man");
            folderImage = "imgSlidesMan";
            DaoProduct.getInstance().currentCategory = "Slides Man";
        }
        if (category.equals("RunningMan")) {
            listFilter = DaoProduct.getInstance().getProductByCategory("Running Man");
            folderImage = "imgRunningMan";
            DaoProduct.getInstance().currentCategory = "Running Man";
        }
        else if (category.equals("SneakersMan")) {
            listFilter = DaoProduct.getInstance().getProductByCategory("Sneakers Man");
            folderImage = "imgSneakersMan";
            DaoProduct.getInstance().currentCategory = "Sneakers Man";
        }
        else if (category.equals("SkateboardMan")) {
            listFilter = DaoProduct.getInstance().getProductByCategory("Skateboard Man");
            folderImage = "imgSkateBoardMan";
            DaoProduct.getInstance().currentCategory = "Skateboard Man";
        }
        else if (category.equals("RunningWoman")) {
            listFilter = DaoProduct.getInstance().getProductByCategory("Running Woman");
            folderImage = "imgRunningWoman";
          DaoProduct.getInstance().currentCategory = "Running Woman";
        }
        else if (category.equals("SneakersWoman")) {
            listFilter = DaoProduct.getInstance().getProductByCategory("Sneakers Woman");
            folderImage = "imgSneakersWoman";
           DaoProduct.getInstance().currentCategory = "Sneakers Woman";
        }
        else if (category.equals("slidesWoman")) {
            listFilter = DaoProduct.getInstance().getProductByCategory("Slides Woman");
            folderImage = "imgSlidesWoman";
           DaoProduct.getInstance().currentCategory = "Slides Woman";
        }
        else if (category.equals("SkateboardWoman")) {
            listFilter = DaoProduct.getInstance().getProductByCategory("Skateboard Woman");
            folderImage = "imgSkateBoardWoman";
            DaoProduct.getInstance().currentCategory = "Skateboard Woman";
        }
        String pag = request.getParameter("pagination");
        if (pag != null) {
            pagination = Integer.parseInt(pag);
        }
        request.setAttribute("Category", category);
        request.setAttribute("Pagination", pagination);
        request.setAttribute("folderImage",folderImage);
        request.setAttribute("categoryProduct", listFilter);

        request.setAttribute("category", a);
        request.setAttribute("categoryGender", b);

        request.getRequestDispatcher("category.jsp").forward(request, response);
    }

}