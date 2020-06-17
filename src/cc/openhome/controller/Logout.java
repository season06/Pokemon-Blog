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

@WebServlet(
	name = "Logout",
	urlPatterns = {"/logout"},
	initParams = {
		@WebInitParam(name = "LOGIN_PATH", value = "homepage.jsp"),
	}
)
public class Logout extends HttpServlet {   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
                             throws ServletException, IOException
    {
        request.getSession().invalidate();
        response.sendRedirect(getInitParameter("LOGIN_PATH"));
    }
}