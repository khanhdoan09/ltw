package controller.category;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import beans.Banner;
import dao.banner.DaoBanner;

@WebServlet(name = "CaterogyGenderController", value = "/caterogyGender")
public class CaterogyGenderController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String categoryGender = request.getParameter("categoryGender");
        System.out.println(categoryGender);
        List<Banner> listCarousel = new ArrayList<Banner>();
        List<Banner> listIntro = new ArrayList<Banner>();
        if (categoryGender.equals("Man")) {
            listCarousel =  DaoBanner.getInstance().getCarouselCategory("carousel-man");
            listIntro = DaoBanner.getInstance().getIntroCategory("intro-category-man");
        } else {
            listCarousel =  DaoBanner.getInstance().getCarouselCategory("carousel-woman");
            listIntro = DaoBanner.getInstance().getIntroCategory("intro-category-woman");
        }
        System.out.println(listCarousel.size());
        System.out.println(listIntro.size());
        request.setAttribute("listCarousel", listCarousel);
        request.setAttribute("listIntro", listIntro);
        request.getRequestDispatcher("./views.customer/banner.jsp").forward(request, response);


    }
}
