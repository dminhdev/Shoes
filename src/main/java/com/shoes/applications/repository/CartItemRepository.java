package com.shoes.applications.repository;

import com.shoes.applications.entity.Cart_Items;
import com.shoes.applications.entity.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CartItemRepository extends JpaRepository<Cart_Items, Integer>{
    @Query(value = "select cart_items.user_id,cart_items.product_id from cart_items inner join product on cart_items.product_id=product.id inner join users on cart_items.user_id=users.id  where cart_items.user_id = ?1 and cart_items.product_id= ?1 ", nativeQuery = true)
    Cart_Items findCartById(long id,String product_id);

    @Query(value = "select cart_items.id,product.name as 'productName' ,product.productImages as 'productImg',cart_items.quantity,cart_items.size,product.price as 'productPrice' from cart_items inner join product on cart_items.product_id=product.id inner join users on cart_items.user_id=users.id where user_id  = ? ", nativeQuery = true)
    List<Cart_Items> getCartByUser(long user_id);

    @Query(value = "select count(id) as 'sum_product_in_cart_of_user' from cart_items where user_id  = ? ", nativeQuery = true)
    Long getCountCartByUser(long user_id);
}
