package poly.store.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.core.AuthenticatedPrincipal;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import poly.store.entity.Order;
import poly.store.service.OrderService;

import java.util.Optional;

@Controller
public class OrderController {
    @Autowired
    OrderService orderService;

    @RequestMapping("order/checkout")
    public String checkout() {
        return "order/checkout";
    }

    @RequestMapping("order/list")
    public String list(Model model, Authentication auth,@RequestParam(name = "page", required = false, defaultValue = "0") Optional<Integer> page) {
        Pageable pageable = PageRequest.of(page.orElse(0), 5);
        Page<Order> orders= orderService.findByCus(auth.getName(),pageable);
        model.addAttribute("orders", orders);
        model.addAttribute("total",orders.getTotalPages()-1);
        return "order/list";
    }

    @RequestMapping("order/detail/{id}")
    public String detail(Model model, @PathVariable("id") Long id) {
        model.addAttribute("order", orderService.findById(id));
        return "order/detail";
    }

}
