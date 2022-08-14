package poly.store.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import poly.store.entity.Product;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {
    @Query("SELECT p from Product p where p.category.id =?1 and p.available=1")
    Page<Product> findByCategoryId(Integer id, Pageable pageable);

    @Query("SELECT p from Product p where p.available=1")
    Page<Product> findPageAll(Pageable pageable);
}
