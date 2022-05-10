package com.shoes.applications.service.impl;

import com.shoes.applications.entity.*;
import com.shoes.applications.repository.CartItemRepository;
import com.shoes.applications.repository.ProductRepository;
import com.shoes.applications.service.CartService;
import com.shoes.applications.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class CartItemImpl implements CartService {
    @Autowired
    private CartItemRepository cartRepo;

    @Autowired
    private ProductRepository proRepo;


    @Override
    public Cart_Items findCartItems(User id, String product_id,Integer size) {
        return cartRepo.findCartById(id.getId(),product_id,size);
    }

    public List<Cart_Items> listCartItems(User user){
        return cartRepo.getCartByUser(user.getId());
    }


    @Override
    public long getCountCartItemByUserId(long user_id) {
        return cartRepo.getCountCartByUser(user_id);
    }

    public Cart_Items createCartByUser(User user, String product_id,Integer quantity,Integer size) {
        Integer addQuantity = quantity;
        Cart_Items cartItem = cartRepo.findCartById(user.getId(),product_id,size);

        if(cartItem !=null){
            addQuantity = cartItem.getQuantity()+ quantity;
            cartItem.setQuantity(addQuantity);
        }else{
            cartItem = new Cart_Items();
            cartItem.setUser_id(user);
            cartItem.setProduct_id(product_id);
            cartItem.setQuantity(quantity);
            cartItem.setSize(size);

        }
        cartRepo.save(cartItem);
        return cartItem;
    }

    @Override
    public void updateCartByUser(User user,Integer quantity,String product_id,Integer size) {
        Integer addQuantity = quantity;
        Cart_Items cartItem = cartRepo.findCartById(user.getId(),product_id,size);
        if(cartItem !=null){
            addQuantity = cartItem.getQuantity()+ quantity;
            cartItem.setQuantity(addQuantity);
        }else{
            cartItem = new Cart_Items();
            cartItem.setUser_id(user);
            cartItem.setProduct_id(product_id);
            cartItem.setQuantity(quantity);
            cartItem.setSize(size);

        }
        cartRepo.save(cartItem);
    }

    @Override
    public void deleteCartByUser(Integer id) {
        cartRepo.deleteById(id);
    }
}
