package poly.store.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import poly.store.entity.OrderDetail;

public interface OrderDetailRepository extends JpaRepository<OrderDetail, Long> {
}
