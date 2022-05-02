package com.shoes.applications.model.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class OrderInfoDTO {
    private long id;

    private long totalPrice;

    private int quantity;

    private int sizeVn;

    private double sizeUs;

    private double sizeCm;

    private String productName;

    private String productImg;

    public OrderInfoDTO(long id, long totalPrice, int sizeVn,int quantity, String productName, String productImg) {
        this.id = id;
        this.totalPrice = totalPrice;
        this.sizeVn = sizeVn;
        this.quantity = quantity;
        this.productName = productName;
        this.productImg = productImg;
    }
}