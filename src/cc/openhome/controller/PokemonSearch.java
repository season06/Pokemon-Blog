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

import cc.openhome.model.Blog;
import cc.openhome.model.Pokemon;
import cc.openhome.model.UserService;

@WebServlet(
	name = "Search",
	urlPatterns = {"/search/*"},
	initParams = {
		@WebInitParam(name = "SEARCH_PATH", value = "search.jsp"),
	}
)
public class PokemonSearch extends HttpServlet {  
	private String SEARCH_PATH;

    @Override
    public void init() throws ServletException {
    	SEARCH_PATH = getServletConfig().getInitParameter("SEARCH_PATH");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
                             throws ServletException, IOException
	{
    	UserService userService = 
    			(UserService) getServletContext().getAttribute("userService");
    	
    	request.setCharacterEncoding("UTF-8");
    	String a_poke = request.getParameter("a_poke");
        Pokemon pokemon = userService.getPokemon(a_poke);
        
        request.setAttribute("pokemon", pokemon);
    	request.getRequestDispatcher(SEARCH_PATH).forward(request, response);
	}
}