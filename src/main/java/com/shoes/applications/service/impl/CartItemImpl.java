package com.shoes.applications.service.impl;

import com.shoes.applications.entity.*;
import com.shoes.applications.repository.CartItemRepository;
import com.shoes.applications.repository.ProductRepository;
import com.shoes.applications.service.Cart_ItemsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class CartItemImpl implements Cart_ItemsService {
    @Autowired
    private CartItemRepository cartRepo;

    @Autowired
    private ProductRepository proRepo;


    @Override
    public Cart_Items findCartItems(User id, String product_id) {
        return cartRepo.findCartById(id.getId(),product_id);
    }

    public List<Cart_Items> listCartItems(User user){
        return cartRepo.getCartByUser(user.getId());
    }


    @Override
    public long getCountCartItemByUserId(long user_id) {
        return cartRepo.getCountCartByUser(user_id);
    }

    public Cart_Items createCartByUser(User user,Integer quantity, String product_id) {
        Integer addQuantity = quantity;
        Product product = proRepo.findById(product_id).get();
        Cart_Items cartItem = cartRepo.findCartById(user.getId(),product.getId());
        if(cartItem !=null){
            addQuantity = cartItem.getQuantity()+ quantity;
            cartItem.setQuantity(addQuantity);
        }else{
            cartItem = new Cart_Items();
            cartItem.setUser(user);
            cartItem.setProduct(product);
            cartItem.setQuantity(quantity);

        }
        cartRepo.save(cartItem);
        return cartItem;
    }

    @Override
    public void updateCartByUser(User user,Integer quantity,String product_id) {
        Integer addQuantity = quantity;
        Product product = proRepo.findById(product_id).get();
        Cart_Items cartItem = cartRepo.findCartById(user.getId(),product.getId());
        if(cartItem !=null){
            addQuantity = cartItem.getQuantity()+ quantity;
            cartItem.setQuantity(addQuantity);
        }else{
            cartItem = new Cart_Items();
            cartItem.setUser(user);
            cartItem.setProduct(product);
            cartItem.setQuantity(quantity);

        }
        cartRepo.save(cartItem);

    }

    @Override
    public void deleteCartByUser(Integer id) {
        cartRepo.deleteById(id);
    }
}
