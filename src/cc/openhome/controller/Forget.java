package cc.openhome.controller;

import java.util.*;
import java.util.regex.Pattern;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cc.openhome.model.Account;
import cc.openhome.model.Blog;
import cc.openhome.model.UserService;
import cc.openhome.pokemon.FunctionTool;


@WebServlet(
	name = "Forget",
	urlPatterns = {"/forget"},
	initParams = {
		@WebInitParam(name = "SUCCESS_PATH", value = "homepage.jsp"),
		@WebInitParam(name = "FORM_PATH", value = "forget.jsp")
	}
)
public class Forget extends HttpServlet {
    private String SUCCESS_PATH;
    private String FORM_PATH;

    @Override
    public void init() throws ServletException {
    	SUCCESS_PATH = getServletConfig().getInitParameter("SUCCESS_PATH");
    	FORM_PATH = getServletConfig().getInitParameter("FORM_PATH");
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		request.getRequestDispatcher(FORM_PATH).forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
							throws ServletException, IOException
	{
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String password2 = request.getParameter("password2");
		String en_pw = "";
		List<String> error = new ArrayList<>();
		
		if(!validatePassword(password, password2))
			error.add("Please check the format of password, and double check your password.");
		else
			en_pw = FunctionTool.Encrypt(password);	
		
		Account account = new Account(username, en_pw);
        UserService userService = (UserService) getServletContext().getAttribute("userService");
        if (!userService.isUserExisted(account))
            error.add("This username is empty.");
        
		String path;
		if(error.isEmpty())
		{
			Account user = userService.getUser(account);
			userService.updatePassword(account);
			try {
				FunctionTool.SendMail(user.getEmail(), "forget password");
				response.getWriter().println("郵件傳送成功");
			} catch (Exception e) {
				throw new ServletException(e);
			}
			path = SUCCESS_PATH;
		}
		else
		{
			request.setAttribute("error", error);
			path = FORM_PATH;
		}
		
		request.getRequestDispatcher(path).forward(request, response);
	}
	
	private boolean validatePassword(String password, String password2)
	{
		final Pattern regex = Pattern.compile(
				"^\\w{6,16}$");
		return password != null && password.equals(password2) && regex.matcher(password).find();
	}
}
