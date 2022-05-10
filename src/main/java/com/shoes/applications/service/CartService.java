package com.shoes.applications.service;

import com.shoes.applications.entity.*;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface CartService {

    Cart_Items findCartItems(User user_id,String product_id,Integer size);

    List<Cart_Items> listCartItems(User user_id);

    long getCountCartItemByUserId(long user_id);

    Cart_Items createCartByUser(User user_id, String product_id,Integer quantity,Integer size);

    void updateCartByUser(User user_id, Integer quantity, String product_id, Integer size);

    void deleteCartByUser(Integer user_id);


}
