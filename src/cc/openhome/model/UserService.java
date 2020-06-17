package cc.openhome.model;

import java.util.*;

public class UserService
{
    private LinkedList<Blog> newest = new LinkedList<Blog>();
    private AccountDAO accountDAO;
    private BlogDAO blogDAO;
    private PokemonDAO pokemonDAO;

    public UserService(AccountDAO userDAO, BlogDAO blogDAO, PokemonDAO pokemonDAO) {
        this.accountDAO = userDAO;
        this.blogDAO = blogDAO;
        this.pokemonDAO = pokemonDAO;
    }
    
    public boolean isUserExisted(Account account)
    {
        return accountDAO.isUserExisted(account);
    }
    
    public void addUser(Account account)
    {
        accountDAO.addAccount(account);
    }

    public boolean checkLogin(Account account)
    {
        if (account.getName() != null && account.getPassword() != null)
        {
            Account storedAcct = accountDAO.getAccount(account); 
            return storedAcct != null && storedAcct.getPassword().equals(account.getPassword()); 
        }
        return false;
    }
    
    private class DateComparator implements Comparator<Blog>
    {
        @Override
        public int compare(Blog b1, Blog b2)
        {
            return -b1.getTime().compareTo(b2.getTime());
        }
    }
    
    private DateComparator comparator = new DateComparator();
    
    public List<Pokemon> getPokemon(Pokemon pokemon)
    {
    	List<Pokemon> list = pokemonDAO.getPokemon(pokemon);
    	return list;
    }
    
    public List<Blog> getInfo(Blog info) {
        List<Blog> blog = blogDAO.getInfo(info);
        Collections.sort(blog, comparator);
        return blog;
    }
    
    public void addInfo(Blog info) {
    	blogDAO.addInfo(info);
        newest.addFirst(info);
        if(newest.size() > 20) {
            newest.removeLast();
        }
    }
   
    public void delInfo(Blog info) {
    	blogDAO.delInfo(info);
        newest.remove(info);
    }

    public List<Blog> getNewest() {
        return newest;
    }
}
