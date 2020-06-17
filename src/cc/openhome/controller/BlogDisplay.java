package cc.openhome.controller;

import java.util.*;
import java.io.BufferedReader;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cc.openhome.model.Account;
import cc.openhome.model.Blog;
import cc.openhome.model.UserService;

@WebServlet(
	name = "Blog",
	urlPatterns = {"/blog/*"},
	initParams = {
		@WebInitParam(name = "BLOG_PATH", value = "blog.jsp"),
	}
)
public class BlogDisplay extends HttpServlet {  
	private String BLOG_PATH;

    @Override
    public void init() throws ServletException {
    	BLOG_PATH = getServletConfig().getInitParameter("BLOG_PATH");
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
                             throws ServletException, IOException
	{
    	UserService userService = 
    			(UserService) getServletContext().getAttribute("userService");
    	
    	String username = (String) request.getSession().getAttribute("login");
    	
	    Account account = new Account();
	    account.setName(username);
	    if(userService.isUserExisted(account))
	    {
	    	Blog info = new Blog();
	    	info.setUsername(username);
	        List<Blog> blog = userService.getInfo(info);
	        request.setAttribute("blog", blog);
	    }
        request.setAttribute("username", username);
    	request.getRequestDispatcher(BLOG_PATH).forward(request, response);
	}
    
}