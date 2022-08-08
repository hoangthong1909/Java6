package poly.store.service;

import poly.store.entity.Product;

import java.util.List;

public interface ProductService {
    public List<Product> findAll();

    Product findById(Integer id);

    List<Product> findCategoryId(Integer id);

    Product create(Product product);

    Product update(Product product);

    void delete(Integer id);
}
