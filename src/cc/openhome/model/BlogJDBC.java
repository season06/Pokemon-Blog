package cc.openhome.model;

import java.sql.Timestamp;
import java.util.*;

import javax.sql.DataSource;

public class BlogJDBC implements BlogDAO
{
    private JDBCtemplate jdbcTemplate;
        
    public BlogJDBC(DataSource dataSource)
    {
        this.jdbcTemplate = new JDBCtemplate(dataSource);
    }
    
    private String find_path(String pokemon_id)
    {
    	List<Map> rows = jdbcTemplate.queryForList(
                "SELECT path FROM pokemon WHERE ID = ?", 
                new Object[] {pokemon_id});
        Map row = rows.get(0);
        return (String) row.get("path");

    }

    @Override
    public List<Blog> getInfo(Blog info)
    {
        List<Map> rows = jdbcTemplate.queryForList(
                "SELECT ID, pokemon_id, txt, time FROM blog WHERE user_id = ?", 
                new Object[] {info.getUsername()});
        List<Blog> blog = new ArrayList<Blog>();
        for(Map row : rows) {
        	String id = (String) row.get("ID");
        	String pokemon = find_path((String) row.get("pokemon_id"));
            String txt = (String) row.get("txt");
            Timestamp time = (Timestamp) row.get("time");
            blog.add(new Blog(id, info.getUsername(), pokemon, txt, time));
        }
        return blog;
    }

    @Override
    public void addInfo(Blog info)
    {
    	jdbcTemplate.update(
                "INSERT INTO blog(ID, user_id, pokemon_id, txt, time) VALUES(?, ?, ?, ?, ?)", 
                new Object[] {info.getID(), info.getUsername(), info.getPokemon(), info.getTxt(), new Timestamp(info.getTime().getTime())});
    }

    @Override
    public void delInfo(Blog info) {
    	jdbcTemplate.update("DELETE FROM blog WHERE ID = ?", 
                new Object[] {info.getID()});
    }
}
