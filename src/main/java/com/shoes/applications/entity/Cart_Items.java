package com.shoes.applications.entity;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@Entity
@Table(name = "cart_items")
public class Cart_Items {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @ManyToOne
    @JsonBackReference
    @JoinColumn(name = "product_id")
    private Product product_id;
    @ManyToOne
    @JsonBackReference
    @JoinColumn(name = "user_id")
    private User user_id;

    private  int quantity;

    private  int size;

}
