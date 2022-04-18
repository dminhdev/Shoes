package com.shoes.applications.model.request;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@AllArgsConstructor
@NoArgsConstructor
public class CreateBrandRequest {
    @NotBlank(message = "Tên nhãn hiệu trống!")
    @Size(max = 50,message = "Tên nhãn hiệu có độ dài tối đa 50 ký tự!")
    private String name;
    private Long id;
    private String description;
    private String thumbnail;
    private boolean status;
	public String getName() {
		return name;
	}
	public Long getId() {
		return id;
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
	public void setName(String name) {
		this.name = name;
	}
	public void setId(Long id) {
		this.id = id;
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
    
}
