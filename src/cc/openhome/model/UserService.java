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

    private class DateComparator implements Comparator<Blog>
    {
        @Override
        public int compare(Blog b1, Blog b2)
        {
            return -b1.getTime().compareTo(b2.getTime());
        }
    }
    private DateComparator comparator = new DateComparator();
    
    public boolean isUserExisted(Account account)
    {
        return accountDAO.isUserExisted(account);
    }
    public int checkLogin(Account account)
    {
        if (account.getName() != null && account.getPassword() != null)
        {
            Account storedAcct = accountDAO.getAccount(account);
            if(storedAcct == null)
            	return 0;
            if(!storedAcct.getPassword().equals(account.getPassword()))
            	return -1;
        }
        return 1;
    }
    
    public Account getUser(Account account)
    {
    	Account user = accountDAO.getAccount(account);
    	return user;
    }
    public void addUser(Account account)
    {
        accountDAO.addAccount(account);
    }
    public void updatePassword(Account account)
    {
        accountDAO.updatePassword(account);
    }
    public void delUser(String username)
    {
    	accountDAO.delUser(username);
    }
    
    public Pokemon getPokemon(String pokemon_name)
    {
    	Pokemon poke = pokemonDAO.getPokemon(pokemon_name);
    	return poke;
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
