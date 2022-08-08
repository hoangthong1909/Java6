package poly.store.service;

import poly.store.entity.Category;
import poly.store.entity.Product;

import java.util.List;

public interface CategoryService {
    List<Category> findAll();

    Category findById(Integer id);

    Category create(Category category);

    Category update(Category category);

     void delete(Integer id);
}
