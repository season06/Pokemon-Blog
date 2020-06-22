package cc.openhome.controller;

import java.util.*;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cc.openhome.model.Account;
import cc.openhome.model.UserService;
import cc.openhome.pokemon.FunctionTool;
import cc.openhome.pokemon.ListenerTest;

@WebServlet(
	name = "Login",
	urlPatterns = {"/login"},
	initParams = {
		@WebInitParam(name = "SUCCESS_PATH", value = "blog"),
		@WebInitParam(name = "ERROR_PATH", value = "homepage.jsp"),
		@WebInitParam(name = "FORBID_PATH", value = "error.jsp")
	}
)
public class Login extends HttpServlet {
	private String SUCCESS_PATH;
    private String ERROR_PATH;
    private String FORBID_PATH;
    private int count;
    
	@Override
    public void init() throws ServletException {
		SUCCESS_PATH = getServletConfig().getInitParameter("SUCCESS_PATH");
		ERROR_PATH = getServletConfig().getInitParameter("ERROR_PATH");
		FORBID_PATH = getServletConfig().getInitParameter("FORBID_PATH");
    }
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
                             throws ServletException, IOException
    {
    	UserService userService = 
			(UserService) getServletContext().getAttribute("userService");
    	
        String username = request.getParameter("username");
        String password = FunctionTool.Encrypt(request.getParameter("password"));
        
        Account account = new Account();
	    account.setName(username);
	    account.setPassword(password);
	    
	    int result = userService.checkLogin(account);
        if(result == 0)
        {
        	request.setAttribute("error", "user isn't exist");
        	request.getRequestDispatcher(ERROR_PATH).forward(request, response);
        }
        else if(result == -1)
        {
        	count++;
        	
        	if(count >= 3)
        	{
        		count = 0;
        		userService.delUser(username);
        		request.getRequestDispatcher(FORBID_PATH).forward(request, response);
        	}
        	
        	request.setAttribute("error", "password error");
        	request.getRequestDispatcher(ERROR_PATH).forward(request, response);
        }
        else
        {
        	count = 0;
        	request.getSession().setAttribute("login", username);
        	response.sendRedirect(SUCCESS_PATH);
        }        
    }
}