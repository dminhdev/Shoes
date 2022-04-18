package com.shoes.applications.controller.shop;
//package com.shoes.applications.controller.shop;
//
//import com.shoes.applications.entity.Rate;
//import com.shoes.applications.entity.User;
//import com.shoes.applications.model.request.CreateRateProductRequest;
//import com.shoes.applications.security.CustomUserDetails;
//import com.shoes.applications.service.RateService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.ResponseEntity;
//import org.springframework.security.core.context.SecurityContextHolder;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestBody;
//
//@Controller
//public class RateController {
//
//    @Autowired
//    private RateService rateService;
//
//    @PostMapping("/api/rates/product")
//    public ResponseEntity<Object> createRate(@RequestBody CreateRateProductRequest createRateProductRequest){
//        User user = ((CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUser();
//        Rate rate = rateService.createRate(createRateProductRequest,user.getId());
//        return ResponseEntity.ok(rate);
//    }
//
//}
