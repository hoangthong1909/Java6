package poly.store.service;

import com.fasterxml.jackson.databind.JsonNode;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import poly.store.entity.Order;

import java.util.List;

public interface OrderService {
    List<Order> getAll();

    Order create(JsonNode orderData);

    Object findById(Long id);

    Page<Order> findByCus(String name, Pageable pageable);

    Order update(Order order);

    void delete(Long id);

}
