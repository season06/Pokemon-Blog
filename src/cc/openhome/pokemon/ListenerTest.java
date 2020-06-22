package cc.openhome.pokemon;

import java.util.Date;

import javax.naming.*;
import javax.servlet.*;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import javax.sql.DataSource;
import cc.openhome.model.*;

@WebListener
public class ListenerTest  implements ServletContextListener, HttpSessionAttributeListener, HttpSessionListener {
	public static int online = 0;
	
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
    
    public void attributeAdded(HttpSessionBindingEvent sbe)
    {
    	System.out.println("-------------attributeAdded()---------------");
    	if(online < 0)
    		online = 0;
    	online++;
    	System.out.println(online);
    }
    public void attributeRemoved(HttpSessionBindingEvent sbe)
    { 
    	System.out.println("-------------attributeRemoved()---------------");
		//System.out.println(new Date(sbe.getSession().getLastAccessedTime()));
    	online--;
    	if(online < 0)
    		online = 0;
    	System.out.println(online);

    }
	public void sessionCreated(HttpSessionEvent se)
	{
		System.out.println("-------------sessionCreated()-----------");
		System.out.println(new Date(se.getSession().getLastAccessedTime()));
	}
	public void sessionDestroyed(HttpSessionEvent se)
	{
		System.out.println("-------------sessionDestroyed()-----------");
		System.out.println(new Date(se.getSession().getCreationTime()));
	}
}