package cc.openhome.model;

import java.util.List;

public interface PokemonDAO
{
	List<Pokemon> getPokemon(String pokemon_name);
}
