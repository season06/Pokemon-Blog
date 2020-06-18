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
		@WebInitParam(name = "ERROR_PATH", value = "homepage.jsp")
	}
)
public class Login extends HttpServlet {
	private String SUCCESS_PATH;
    private String ERROR_PATH;
    
	@Override
    public void init() throws ServletException {
		SUCCESS_PATH = getServletConfig().getInitParameter("SUCCESS_PATH");
		ERROR_PATH = getServletConfig().getInitParameter("ERROR_PATH");
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
        if(userService.checkLogin(account))
        {
        	request.getSession().setAttribute("login", username);
        	response.sendRedirect(SUCCESS_PATH);
        }
        else
        {
        	request.setAttribute("error", "login fail");
        	request.getRequestDispatcher(ERROR_PATH).forward(request, response);
        }        
    }
}