package cc.openhome.model;

import java.sql.Timestamp;
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
    public List<Pokemon> getPokemon(String pokemon_name)
    {
        List<Map> rows = jdbcTemplate.queryForList("SELECT * FROM pokemon WHERE pokemon_name = ?", 
        		new Object[] {pokemon_name});
        List<Pokemon> poke = new ArrayList<Pokemon>();
        for(Map row : rows)
        {
        	String id = (String) row.get("ID");
        	String name = (String) row.get("pokemon_name");
            String attribute = (String) row.get("attribute");
            String path = (String) row.get("path");
            poke.add(new Pokemon(id, name, attribute, path));
        }
        return poke;
    }
}
