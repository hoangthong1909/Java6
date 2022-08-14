package poly.store.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import poly.store.entity.Product;
import poly.store.service.ProductService;

import java.util.List;
import java.util.Optional;

@Controller
public class ProductController {
    @Autowired
    ProductService productService;

    @RequestMapping("product/list")
    public String list(Model model,@RequestParam(name = "page", required = false, defaultValue = "0") Optional<Integer> page, @RequestParam(value = "id", required = false) Optional<Integer> id) {
        Pageable pageable = PageRequest.of(page.orElse(0), 6);
        if (id.isPresent()) {
            Page<Product> list = productService.findCategoryId(id.get(),pageable);
            model.addAttribute("items", list);
            model.addAttribute("total",list.getTotalPages()-1);
            model.addAttribute("check",list.getContent().size());
        } else {
            Page<Product> list = productService.findPageAll(pageable);
            model.addAttribute("items", list);
            model.addAttribute("total",list.getTotalPages()-1);
        }
        return "product/list";
    }

    @RequestMapping("product/detail/{id}")
    public String detail(Model model, @PathVariable("id") Integer id) {
        Product item = productService.findById(id).get();
        model.addAttribute("item", item);
        return "product/detail";
    }
}
