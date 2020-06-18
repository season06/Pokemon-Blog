package cc.openhome.controller;

import java.util.*;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cc.openhome.model.Blog;
import cc.openhome.model.UserService;

@WebServlet(
	name = "NewMessage",
	urlPatterns = {"/new_message"},
	initParams = {
		@WebInitParam(name = "SUCCESS_PATH", value = "blog"),
		@WebInitParam(name = "ERROR_PATH", value = "search.jsp"),
	}
)
public class NewMessage extends HttpServlet
{
	private String SUCCESS_PATH;
	private String ERROR_PATH;

    @Override
    public void init() throws ServletException
    {
    	ERROR_PATH = getServletConfig().getInitParameter("MEMBER_PATH");
    	SUCCESS_PATH = getServletConfig().getInitParameter("SUCCESS_PATH");
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
                             		throws ServletException, IOException
    {
    	String username = (String) request.getSession().getAttribute("login");
    	String pokemon = "¥Ö¥d¥C";
    	UserService userService = 
    			(UserService) getServletContext().getAttribute("userService");
    	
    	Blog blog = new Blog();
    	
    	request.setCharacterEncoding("UTF-8");
    	String txt = request.getParameter("txt");
    	
    	if(txt == null || txt.length() == 0)
    	{
    		response.sendRedirect(ERROR_PATH);
    		return;
    	}
    	
    	if(txt.length() < 200)
    	{
    		blog.setID(UUID.randomUUID().toString().replaceAll("-", ""));
    		blog.setUsername(username);
    		blog.setPokemon(pokemon);
    		blog.setTxt(txt);
    		blog.setTime(new Date());
    		userService.addInfo(blog);
    		response.sendRedirect(SUCCESS_PATH);
    	}
    	else
    		request.getRequestDispatcher(ERROR_PATH).forward(request, response);
    }

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
}
