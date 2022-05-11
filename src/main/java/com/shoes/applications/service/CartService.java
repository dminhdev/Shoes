package com.shoes.applications.service;

import com.shoes.applications.entity.*;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface CartService {

    Cart_Items findCartItems(User user_id,String product_id,Integer size);

    List<Cart_Items> listCartItems(User user_id);


    long getCountCartItemByUserId(long user_id);

    Cart_Items createCartByUser(User user_id, String product_id,Integer quantity,Integer size);

    void updateCartByUser(User user_id, Integer quantity, String product_id, Integer size);

    //Xóa sản phẩm theo id
    void deleteCart(Integer[] ids);

    //Xóa sản phẩm theo id
    void deleteCartByUser(Integer user_id);


}
