package poly.store.rest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import poly.store.entity.Product;
import poly.store.service.ProductService;

import javax.validation.Valid;
import java.util.List;
import java.util.Optional;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/products")
public class ProductRestController {
    @Autowired
    ProductService productService;

    @GetMapping()
    public List<Product> getAll() {
        return productService.findAll();
    }

    @PostMapping
    public ResponseEntity<?> create(@Valid @RequestBody Product product, BindingResult result) {
        if (result.hasErrors()) {
            return new ResponseEntity<>("Please enter all fields information", HttpStatus.BAD_REQUEST);
        }
        return new ResponseEntity<>(productService.create(product), HttpStatus.OK);
    }

    @GetMapping("{id}")
    public ResponseEntity<?> getOne(@PathVariable("id") Integer id) {
        Optional<Product> product = productService.findById(id);
        return product.isPresent()
                ? new ResponseEntity<>(product, HttpStatus.OK)
                : new ResponseEntity<>("Cannot find product with id = " + id, HttpStatus.NOT_FOUND);
    }

    @PutMapping("{id}")
    public ResponseEntity<?> update(@Valid @RequestBody Product product,BindingResult result,@PathVariable("id") Integer id) {
        if (result.hasErrors()) {
            return new ResponseEntity<>("Please enter all fields information", HttpStatus.BAD_REQUEST);
        }
        Optional<Product> pro = productService.findById(id);
        return pro.isPresent()
                ? new ResponseEntity<>(productService.update(product), HttpStatus.OK)
                : new ResponseEntity<>("Cannot find product to update", HttpStatus.NOT_FOUND);
    }

    @DeleteMapping("{id}")
    public void delete(@PathVariable("id") Integer id) {
        productService.delete(id);
    }
}
