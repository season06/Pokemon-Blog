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
	name = "DelMessage",
	urlPatterns = {"/del_message"},
	initParams = {
		@WebInitParam(name = "BLOG_PATH", value = "blog"),
	}
)
public class DelMessage extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
                             throws ServletException, IOException
    {
    	String username = (String) request.getSession().getAttribute("login");
        String id = request.getParameter("id"); 
        UserService userService = (UserService) getServletContext().getAttribute("userService");
        
        Blog blog = new Blog();
        blog.setUsername(username);
        blog.setID(id);
        userService.delInfo(blog);
    	response.sendRedirect(getInitParameter("BLOG_PATH"));
    }
}
