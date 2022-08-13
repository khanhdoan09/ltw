package filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Locale;

@WebFilter(filterName = "SecurityFilter")
public class SecurityFilter implements Filter {


    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        String loginURICustomer = request.getContextPath() + "/home#logIn";
        String loginURIAdmin = request.getContextPath() + "/views/admin/authentication/signIn/signInAdmin.jsp";

        String path = request.getRequestURI().substring(request.getContextPath().length());
        // check sign in customer
        if(path.contains("OrderController") || path.contains("addCart") || path.contains("customer")){
            boolean isLogin = request.getSession().getAttribute("userId") != null ? true : false;
            if (isLogin==true) {
                chain.doFilter(request, response);
            }
            else {
                response.sendRedirect(loginURICustomer);
            }
        }
        // check sign in admin
         else if(path.contains("/views/admin/authentication/signIn") || path.contains("/authentication/signUp/signUp.jsp") || !path.toLowerCase().contains("admin")){
                chain.doFilter(request, response);
                return;
        }
        else {
            boolean isLogin = request.getSession().getAttribute("userAdmin") != null ? true : false;
            if (isLogin==true) {
            chain.doFilter(request, response);
            }
            else {
                response.sendRedirect(loginURIAdmin);
            }
             return;
         }
    }

    @Override
    public void init(FilterConfig fConfig) throws ServletException {

    }
}
