package poly.store.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import poly.store.entity.Account;

import java.util.List;

public interface AccountRepository extends JpaRepository<Account, String> {
    @Query("select distinct obj.account from Authority obj where obj.role.id in ('Admin','Staff')")
    List<Account> getAdmin();
}
