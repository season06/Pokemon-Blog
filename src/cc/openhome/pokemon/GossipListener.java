package cc.openhome.pokemon;

import javax.naming.*;
import javax.servlet.*;
import javax.servlet.annotation.WebListener;
import javax.sql.DataSource;
import cc.openhome.model.*;

@WebListener
public class GossipListener implements ServletContextListener {
    public void contextInitialized(ServletContextEvent sce) {
        try {
            Context ctx = new InitialContext();
            DataSource dataSource = (DataSource) ctx.lookup("java:/comp/env/jdbc/pokemon");
            ServletContext context = sce.getServletContext();
            context.setAttribute("userService", new UserService(
                    new AccountJDBC(dataSource), new BlogJDBC(dataSource), new PokemonJDBC(dataSource)));
        } catch (NamingException ex) {
            throw new RuntimeException(ex);
        }
    }

    public void contextDestroyed(ServletContextEvent sce) {}
}
