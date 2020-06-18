package cc.openhome.controller;

import java.util.*;
import java.util.regex.Pattern;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cc.openhome.model.Account;
import cc.openhome.model.UserService;


@WebServlet(
	name = "Register",
	urlPatterns = {"/register"},
	initParams = {
		@WebInitParam(name = "SUCCESS_PATH", value = "register_success.jsp"),
		@WebInitParam(name = "FORM_PATH", value = "register.jsp")
	}
)
public class Register extends HttpServlet {
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
		String email = request.getParameter("email");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String password2 = request.getParameter("password2");
		String en_pw = "";
		
		List<String> error = new ArrayList<>();
		if(!validateEmail(email))
		{
			error.add("Email is empty or format is not correct!");
		}
		if(!validateUsername(username))
		{
			error.add("Username is empty or format is not correct!");
		}
		if(!validatePassword(password, password2))
		{
			error.add("Please check the format of password, and double check your password.");
		}
		
		en_pw = encrypt(password);	
		
		Account account = new Account(username, en_pw, email);
        UserService userService = (UserService) getServletContext().getAttribute("userService");
        if (userService.isUserExisted(account))
        {
            error.add("This userName is exist or empty.");
        }
        
		String path = FORM_PATH;
		if(error.isEmpty())
		{
			path = SUCCESS_PATH;
			userService.addUser(account);
		}
		else
		{
			request.setAttribute("error", error);
		}
		
		request.getRequestDispatcher(path).forward(request, response);
	}
	
	private boolean validateEmail(String email)
	{
		final Pattern regex = Pattern.compile(
				"^[_a-z0-9-]+([.][_a-z0-9-]+)*@[a-z0-9-]+([.][a-z0-9-]+)*$");
		return email != null && regex.matcher(email).find();
	}
	
	private boolean validateUsername(String username)
	{
		final Pattern regex = Pattern.compile(
				"^\\w{1,16}$");
		return username != null && regex.matcher(username).find();
	}
	
	private boolean validatePassword(String password, String password2)
	{
		final Pattern regex = Pattern.compile(
				"^\\w{6,16}$");
		return password != null && password.equals(password2) && regex.matcher(password).find();
	}
	
	private String encrypt(String password)
	{
		char[] hexDigest = new char[]{'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte[] bytes = password.getBytes();
			md.update(bytes);
			byte[] newBytes = md.digest();
			
			char[] result = new char[newBytes.length*2];
			for(int i = 0, j = 0; i < newBytes.length; i++)
			{
				byte c = newBytes[i];
				result[j++] = hexDigest[c >>> 4 & 0xf];
				result[j++] = hexDigest[c & 0xf];
			}
			return new String(result);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return "";
	}
}
