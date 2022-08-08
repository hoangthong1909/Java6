package poly.store.rest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import poly.store.entity.Category;
import poly.store.entity.Category;
import poly.store.service.CategoryService;

import java.util.List;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/category")
public class CategoryRestController {
    @Autowired
    CategoryService categoryService;

    @GetMapping()
    public List<Category> getAll(){
        return categoryService.findAll();
    }
    @PostMapping
    public Category create(@RequestBody Category category) {
        return categoryService.create(category);
    }

    @GetMapping("{id}")
    public Category getOne(@PathVariable("id")Integer id){
        return categoryService.findById(id);
    }

    @PutMapping("{id}")
    public Category update(@PathVariable("id") Integer id,@RequestBody Category category) {
        return categoryService.update(category);
    }

    @DeleteMapping("{id}")
    public void delete(@PathVariable("id") Integer id) {
        categoryService.delete(id);
    }
}
