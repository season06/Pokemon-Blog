package cc.openhome.model;

import java.util.*;

public class Pokemon {
	private String id;
	private String name;
	private String attribute;
	private String path;
		
	public Pokemon() {}
    
    public Pokemon(String id, String name, String attribute, String path)
    {
    	this.id = id;
    	this.name = name;
    	this.attribute = attribute;
        this.path = path;
    }
	public String getID()
	{
		return id;
	}
	public String getName()
	{
		return name;
	}
	public String getAttribute()
	{
		return attribute;
	}
	public String getPicture()
	{
		return path;
	}
	public void setID(String id)
	{
		this.id = id;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public void setAttribute(String attribute)
	{
		this.attribute = attribute;
	}
	public void setPicture(String path)
	{
		this.path = path;
	}
}
