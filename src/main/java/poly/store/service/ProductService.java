package poly.store.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import poly.store.entity.Product;

import java.util.List;
import java.util.Optional;

public interface ProductService {
    List<Product> findAll();

    Page<Product> findPageAll(Pageable pageable);

    Optional<Product> findById(Integer id);

    Page<Product> findCategoryId(Integer id,Pageable pageable);

    Product create(Product product);

    Product update(Product product);

    void delete(Integer id);
}
