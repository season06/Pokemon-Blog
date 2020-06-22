package cc.openhome.model;

import java.util.*;

import javax.sql.DataSource;

public class PokemonJDBC implements PokemonDAO
{
    private JDBCtemplate jdbcTemplate;
        
    public PokemonJDBC(DataSource dataSource)
    {
        this.jdbcTemplate = new JDBCtemplate(dataSource);
    }

    @Override
    public Pokemon getPokemon(String pokemon_name)
    {
        List<Map> rows = jdbcTemplate.queryForList("SELECT * FROM pokemon WHERE ID = ?", 
        		new Object[] {pokemon_name});
        if(rows.size() == 1) 
        {
            Map row = rows.get(0);
            String id = (String) row.get("ID");
        	String name = (String) row.get("pokemon_name");
            String attribute = (String) row.get("attribute");
            String path = (String) row.get("path");
            return new Pokemon(id, name, attribute, path);
        }
        return null;
    }
}
