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
    public List<Pokemon> getPokemon(Pokemon pokemon)
    {
        List<Map> rows = jdbcTemplate.queryForList("SELECT * FROM pokemon");
        List<Pokemon> list = new ArrayList<Pokemon>();
        for(Map row : rows) {
        	String id = (String) row.get("ID");
        	String name = (String) row.get("pokemon_name");
            String attribute = (String) row.get("attribute");
            String path = (String) row.get("path");
            list.add(new Pokemon(id, name, attribute, path));
        }
        return list;
    }
}
