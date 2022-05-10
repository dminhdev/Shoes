package com.shoes.applications.model.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class CartDTO {
    private long id;
    private String product_id;
    private long user_id;
    private int quantity;
    private int size;

}
