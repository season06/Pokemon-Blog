package cc.openhome.model;

public interface AccountDAO
{
    boolean isUserExisted(Account account);
    Account getAccount(Account account); 
    void addAccount(Account account);
    void updatePassword(Account account);
}
