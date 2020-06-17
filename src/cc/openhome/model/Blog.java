package cc.openhome.model;

import java.util.*;
import javax.servlet.http.HttpServlet;

public class Blog extends HttpServlet {
	private String id;
    private String username;
    private String pokemon;
    private String txt;
    private Date time;
    
    public Blog() {}
    
    public Blog(String id, String username, String pokemon, String txt, Date time)
    {
    	this.id = id;
    	this.username = username;
    	this.pokemon = pokemon;
        this.txt = txt;
    	this.time = time;
    }
    
    public String getID()
    {
    	return id;
    }
    public String getUsername()
    {
    	return username;
    }
    public String getPokemon()
    {
    	return pokemon;
    }
    public String getTxt()
    {
    	return txt;
    }
    public Date getTime()
    {
    	return time;
    }
    
    public void setID(String id)
    {
    	this.id = id;
    }
    public void setUsername(String username)
    {
        this.username = username;
    }
    public void setPokemon(String pokemon)
    {
        this.pokemon = pokemon;
    }
    public void setTxt(String txt)
    {
        this.txt = txt;
    }
    public void setTime(Date time)
    {
        this.time = time;
    }
}
