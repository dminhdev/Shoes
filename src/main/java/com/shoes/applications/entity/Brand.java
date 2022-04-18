package com.shoes.applications.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.shoes.applications.model.dto.ChartDTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.List;

@SqlResultSetMappings(
        value = {
                @SqlResultSetMapping(
                        name = "chartBrandDTO",
                        classes = @ConstructorResult(
                                targetClass = ChartDTO.class,
                                columns = {
                                        @ColumnResult(name = "label",type = String.class),
                                        @ColumnResult(name = "value",type = Integer.class)
                                }
                        )
                )
        }
)
@NamedNativeQuery(
        name = "getProductOrderBrands",
        resultSetMapping = "chartBrandDTO",
        query = "select b.name as label, count(o.quantity) as value  from brand b " +
                "inner join product p on p.brand_id = b.id " +
                "inner join orders o on p.id = o.product_id " +
                "where o.status = 3 " +
                "group by b.id"
)

@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "brand")
public class Brand {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name = "name",nullable = false,unique = true)
    private String name;
    @Column(name = "description")
    private String description;
    @Column(name = "thumbnail")
    private String thumbnail;
    @Column(name = "status",columnDefinition = "BOOLEAN")
    private boolean status;
    @Column(name = "created_at")
    private Timestamp createdAt;
    @Column(name = "modified_at")
    private Timestamp modifiedAt;
    @OneToMany(mappedBy = "brand")
    @JsonIgnore
    private List<Product> products;
	public Long getId() {
		return id;
	}
	public String getName() {
		return name;
	}
	public String getDescription() {
		return description;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public boolean isStatus() {
		return status;
	}
	public Timestamp getCreatedAt() {
		return createdAt;
	}
	public Timestamp getModifiedAt() {
		return modifiedAt;
	}
	public List<Product> getProducts() {
		return products;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}
	public void setModifiedAt(Timestamp modifiedAt) {
		this.modifiedAt = modifiedAt;
	}
	public void setProducts(List<Product> products) {
		this.products = products;
	}
    
}
