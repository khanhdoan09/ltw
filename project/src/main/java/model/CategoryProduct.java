package model;

import model.DaoProduct;
import model.Product;

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
        String category = request.getParameter("categoryProduct");
        List<Product> listFilter = new ArrayList<Product>();
        String folderImage = "";
        if (category.equals("slidesManCategory")) {
            listFilter = DaoProduct.getInstance().getProductByCategory("Slides Man");
            folderImage = "imgSlidesMan";
            DaoProduct.getInstance().currentFolderCategory = "imgSlidesMan";
            DaoProduct.getInstance().currentCategory = "Slides Man";
        }
        if (category.equals("runningManCategory")) {
            listFilter = DaoProduct.getInstance().getProductByCategory("Running Man");
            folderImage = "imgRunningMan";
            DaoProduct.getInstance().currentFolderCategory = "imgRunningMan";
            DaoProduct.getInstance().currentCategory = "Running Man";
        }
        else if (category.equals("sneakersManCategory")) {
            listFilter = DaoProduct.getInstance().getProductByCategory("Sneakers Man");
            folderImage = "imgSneakersMan";
            DaoProduct.getInstance().currentFolderCategory = "imgSneakersMan";
            DaoProduct.getInstance().currentCategory = "Sneakers Man";
        }
        else if (category.equals("skateboardManCategory")) {
            listFilter = DaoProduct.getInstance().getProductByCategory("Skateboard Man");
            folderImage = "imgSkateBoardMan";
            DaoProduct.getInstance().currentFolderCategory = "imgSkateBoardMan";
            DaoProduct.getInstance().currentCategory = "Skateboard Man";
        }
        else if (category.equals("runningWomanCategory")) {
            listFilter = DaoProduct.getInstance().getProductByCategory("Running Woman");
            folderImage = "imgRunningWoman";
           DaoProduct.getInstance().currentFolderCategory = "imgRunningWoman";
          DaoProduct.getInstance().currentCategory = "Running Woman";
        }
        else if (category.equals("sneakersWomanCategory")) {
            listFilter = DaoProduct.getInstance().getProductByCategory("Sneakers Woman");
            folderImage = "imgSneakersWoman";
            DaoProduct.getInstance().currentFolderCategory = "imgSneakersWoman";
           DaoProduct.getInstance().currentCategory = "Sneakers Woman";
        }
        else if (category.equals("slidesWomanCategory")) {
            listFilter = DaoProduct.getInstance().getProductByCategory("Slides Woman");
            folderImage = "imgSlidesWoman";
            DaoProduct.getInstance().currentFolderCategory = "imgSlidesWoman";
           DaoProduct.getInstance().currentCategory = "Slides Woman";
        }
        else if (category.equals("skateboardWomanCategory")) {
            listFilter = DaoProduct.getInstance().getProductByCategory("Skateboard Woman");
            folderImage = "imgSkateBoardWoman";
           DaoProduct.getInstance().currentFolderCategory = "imgSkateBoardWoman";
            DaoProduct.getInstance().currentCategory = "Skateboard Woman";
        }
        String pag = request.getParameter("pagination");
        if (pag != null) {
            pagination = Integer.parseInt(pag);
        }
        request.setAttribute("Category", category);
        request.setAttribute("Pagination", pagination);
        request.setAttribute("folderImage",folderImage);
        request.setAttribute("filter", listFilter);
        request.getRequestDispatcher("category.jsp").forward(request, response);
    }

}