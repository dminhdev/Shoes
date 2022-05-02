package com.shoes.applications.service;

import com.shoes.applications.entity.*;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface Cart_ItemsService {

    Cart_Items findCartItems(User id,String product_id);

    List<Cart_Items> listCartItems(User user_id);

    long getCountCartItemByUserId(long user_id);

    Cart_Items createCartByUser(User user_id,Integer quantity, String product_id);

    void updateCartByUser(User id,Integer quantity,String product_id);

    void deleteCartByUser(Integer id);


}
