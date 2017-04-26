package com.tramhuong.dto;

/**
 * Created by PhuongTN1 on 11/4/2016.
 */
public class ProductRelateDto {
    private Integer id;
    private Long productId;
    private String img;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
}
