package com.shoes.applications.controller.shop;

import com.shoes.applications.entity.Cart_Items;
import com.shoes.applications.entity.User;
import com.shoes.applications.model.dto.DetailProductInfoDTO;
import com.shoes.applications.repository.CartItemRepository;
import com.shoes.applications.security.CustomUserDetails;
import com.shoes.applications.service.CartService;
import com.shoes.applications.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class CartController {

    @Autowired
    private CartService cartService;
    @Autowired
    private ProductService productService;


    @GetMapping("/cart")
    public ResponseEntity<Object> getItemCartByUser(Model model) {
        User user =((CustomUserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUser();
        List<Cart_Items> cartItems = cartService.listCartItems(user);
        model.addAttribute("cartItems",cartItems);
        return ResponseEntity.ok(cartItems);
    }
    @PostMapping("api/cart/{pid}/{size}/{qty}")
    public ResponseEntity<Object> addItemCart(@PathVariable("pid") String productId,
                                              @PathVariable("size") Integer size,
                                              @PathVariable("qty") Integer quantity ) {
        User user =((CustomUserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUser();
        Cart_Items cartItems =  cartService.createCartByUser(user,productId,quantity);
        return ResponseEntity.ok(cartItems);
    }
    @PutMapping("/api/cart/update/{id}")
    public ResponseEntity<Object> updateItemCart(@PathVariable long id) {
        User user =((CustomUserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUser();
       // DetailProductInfoDTO  product = productService.getDetailProductById(id);
        //cartService.updateCartByUser(user.getId(),product.getId());
        return ResponseEntity.ok("Sửa sản phẩm thành công!");
    }
    @DeleteMapping("/api/cart/delete/{id}")
    public ResponseEntity<Object> deleteItemCart(@PathVariable int id) {
        cartService.deleteCartByUser(id);
        return ResponseEntity.ok("Xóa sản phẩm thành công!");
    }
    @GetMapping("/api/user/count/cartItems")
    public ResponseEntity<Object> getCountItemsCart(){
        User user =((CustomUserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUser();
        long countCartItem = cartService.getCountCartItemByUserId(user.getId());
        return ResponseEntity.ok(countCartItem);
    }
}
