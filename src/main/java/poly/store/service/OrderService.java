package poly.store.service;

import com.fasterxml.jackson.databind.JsonNode;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import poly.store.entity.Order;

import java.util.List;

public interface OrderService {
    Order create(JsonNode orderData);

    Object findById(Long id);

    Page<Order> findByCus(String name, Pageable pageable);
}
