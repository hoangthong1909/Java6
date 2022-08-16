package poly.store.rest.controller;

import com.fasterxml.jackson.databind.JsonNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import poly.store.entity.Category;
import poly.store.entity.Order;
import poly.store.service.OrderService;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/orders")
public class OrderRestController {
    @Autowired
    private OrderService orderService;

    @PostMapping
    public Order saveOrder(@RequestBody JsonNode orderData) {
        return orderService.create(orderData);
    }

    @GetMapping()
    public ResponseEntity<?> getAll() {
        return new ResponseEntity<>(orderService.getAll(), HttpStatus.OK);
    }

    @GetMapping("/user/{id}")
    public ResponseEntity<?> findOrderByUser(@PathVariable Long id) {
        Order order = (Order) orderService.findById(id);
        return new ResponseEntity<>(order.getOrderDetails(), HttpStatus.OK);
    }

    @PutMapping("confirm/{id}")
    public ResponseEntity<?> confirm(@PathVariable("id") Long id, @RequestBody Order order) {
        order.setStatus(1);
        return new ResponseEntity<>(orderService.update(order), HttpStatus.OK);
    }

    @PutMapping("cancel/{id}")
    public ResponseEntity<?> cancel(@PathVariable("id") Long id, @RequestBody Order order) {
        order.setStatus(2);
        return new ResponseEntity<>(orderService.update(order), HttpStatus.OK);
    }

    @DeleteMapping("{id}")
    public void delete(@PathVariable("id") Long id) {
        orderService.delete(id);
    }
}
