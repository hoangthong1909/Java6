package poly.store.service;

import poly.store.entity.Account;
import poly.store.entity.Account;

import java.util.List;

public interface AccountService {
    public Account findById(String username);

    List<Account> getAdmin();

    List<Account> findAll();

    Account create(Account account);

    Account update(Account account);

    void delete(String username);

}
