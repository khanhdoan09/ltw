package listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import java.io.File;

@WebListener
public class FileLocationContextListener implements ServletContextListener, HttpSessionListener, HttpSessionAttributeListener {

    public FileLocationContextListener() {
    }

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext ctx = sce.getServletContext();

        String relativePath = ctx.getInitParameter("tempfile.dir");
        String rootPath = System.getProperty("catalina.home");
        rootPath = rootPath.substring(0, rootPath.lastIndexOf("\\"));
//        rootPath += "\\project\\src\\main\\webapp\\data\\imgAll";
        rootPath += "\\project\\target\\project-1.0-SNAPSHOT\\data\\imgAll";
        File file = new File(rootPath  + File.separator + relativePath);
        if(file.exists())
            file.mkdirs();
        System.out.println("File directory created to be used for storing files");
        ctx.setAttribute("FILES_DIR_FILE", file);
        ctx.setAttribute("FILES_DIR", rootPath + File.separator + relativePath);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        /* This method is called when the servlet Context is undeployed or Application Server shuts down. */
    }

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        /* Session is created. */
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        /* Session is destroyed. */
    }

    @Override
    public void attributeAdded(HttpSessionBindingEvent sbe) {
        /* This method is called when an attribute is added to a session. */
    }

    @Override
    public void attributeRemoved(HttpSessionBindingEvent sbe) {
        /* This method is called when an attribute is removed from a session. */
    }

    @Override
    public void attributeReplaced(HttpSessionBindingEvent sbe) {
        /* This method is called when an attribute is replaced in a session. */
    }
}
