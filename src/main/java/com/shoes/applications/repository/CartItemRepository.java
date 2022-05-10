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
    @Query(value = "select * from cart_items p where p.user_id = ?1 and p.product_id= ?2 and p.size= ?3 ", nativeQuery = true)
    Cart_Items findCartById(long user_id,String product_id,Integer size);

    @Query(value = "select a.id,b.name,a.product_id,a.user_id,b.images,a.quantity,a.size,b.price from cart_items a inner join product b on a.product_id = b.id where a.user_id  = ?1 ", nativeQuery = true)
    List<Cart_Items> listCartByUser(long user_id);

    @Query(value = "select sum(quantity) as 'sum_product_in_cart_of_user' from cart_items where user_id  = ?1 ", nativeQuery = true)
    Long getCountCartByUser(long user_id);
}
