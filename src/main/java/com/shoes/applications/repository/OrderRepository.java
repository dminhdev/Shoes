package com.shoes.applications.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.shoes.applications.entity.Order;
import com.shoes.applications.model.dto.OrderDetailDTO;
import com.shoes.applications.model.dto.OrderInfoDTO;

import java.util.List;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
    @Query(value = "SELECT * FROM orders " +
            "WHERE id LIKE CONCAT('%',?1,'%') " +
            "AND receiver_name LIKE CONCAT('%',?2,'%') " +
            "AND receiver_phone LIKE CONCAT('%',?3,'%') " +
            "AND status LIKE CONCAT('%',?4,'%') " +
            "AND product_id LIKE CONCAT('%',?5,'%')", nativeQuery = true)
    Page<Order> adminGetListOrder(String id, String name, String phone, String status, String product, Pageable pageable);

    @Query(nativeQuery = true, name = "getListOrderOfPersonByStatus")
    List<OrderInfoDTO> getListOrderOfPersonByStatus(int status, long userId);

    @Query(nativeQuery = true, name = "userGetDetailById")
    OrderDetailDTO userGetDetailById(long id, long userId);

//    @Query(value = "select count(product_id) AS A from orders where product_id = ?1;", nativeQuery = true)
//    int countByProductIds(String id);
//    @Query(nativeQuery = true, value = "SELECT COUNT(DISTINCT oders.id) " +
//            "FROM oders WHERE oders.user_id = ?1; ")
    int countByProductId(String id);
}
