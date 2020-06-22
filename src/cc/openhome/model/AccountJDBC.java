package cc.openhome.model;

import java.util.*;
import javax.sql.DataSource;

public class AccountJDBC implements AccountDAO
	{
    private JDBCtemplate jdbcTemplate;
    
    public AccountJDBC(DataSource dataSource)
    {
        this.jdbcTemplate = new JDBCtemplate(dataSource);
    }

    @Override
    public boolean isUserExisted(Account account)
    {
        Map row = jdbcTemplate.queryForList("SELECT COUNT(1) FROM user WHERE account = ?", 
                new Object[] { account.getName() }).get(0);
        long count = (Long) row.get("COUNT(1)");
        return count == 1;
    }

    @Override
    public Account getAccount(Account account)
    {
        List<Map> rows = jdbcTemplate.queryForList("SELECT password, email FROM user WHERE account = ?",
                new Object[] { account.getName() });
        if(rows.size() == 1) 
        {
            Map row = rows.get(0);
            String email = (String) row.get("email");
            String password = (String) row.get("password");
            return new Account(account.getName(), password, email);
        }
        return null;
    }
    
    @Override
    public void addAccount(Account account)
    {
        jdbcTemplate.update(
                "INSERT INTO user(account, password, email) VALUES(?, ?, ?)", 
                new Object[] {account.getName(), account.getPassword(), account.getEmail()});
    }

    @Override
    public void updatePassword(Account account)
    {
        jdbcTemplate.update(
                "UPDATE user SET password = ? WHERE account = ?", 
                new Object[] {account.getPassword(), account.getName()});
    }
}
