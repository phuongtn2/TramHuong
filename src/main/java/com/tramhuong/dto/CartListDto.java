package com.tramhuong.dto;
import java.util.List;

/**
 * Created by PhuongTN1 on 11/4/2016.
 */
public class CartListDto {
    private Integer id;
    private List<CartDto> cartDtoList;
    private String totalPrice;
    private Double totalProductPrice;
    private String description;
    private String orderCode;
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public List<CartDto> getCartDtoList() {
        return cartDtoList;
    }

    public void setCartDtoList(List<CartDto> cartDtoList) {
        this.cartDtoList = cartDtoList;
    }

    public String getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(String totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getOrderCode() {
        return this.orderCode;
    }

    public void setOrderCode(String orderCode) {
        this.orderCode = orderCode;
    }

    public Double getTotalProductPrice() {
        return totalProductPrice;
    }

    public void setTotalProductPrice(Double totalProductPrice) {
        this.totalProductPrice = totalProductPrice;
    }
}
