package poly.store.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import poly.store.entity.Category;
import poly.store.entity.OrderDetail;

import javax.persistence.*;
import javax.validation.constraints.*;
import java.time.LocalDate;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "products")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id", nullable = false)
    private Integer id;

    @NotNull(message = "Name is not Null")
    @Size(min = 2, message = "{validation.name.size.too_short}")
    @Size(max = 200, message = "{validation.name.size.too_long}")
    @Column(name = "Name", nullable = false, length = 50)
    private String name;

    @Column(name = "Image", nullable = false, length = 50)
    private String image;

    @NotNull(message = "Price is not Null")
    @Min(value = 0)
    @Column(name = "Price", nullable = false)
    private Double price;

    @Column(name = "Createdate", nullable = false)
    private LocalDate createDate;

    @Column(name = "Available", nullable = false)
    private Integer available;

    @NotNull(message = "Category is not Null")
    @ManyToOne
    @JoinColumn(name = "Categoryid")
    private Category category;

    @JsonIgnore
    @OneToMany(mappedBy = "product")
    List<OrderDetail> orderDetails;
}
