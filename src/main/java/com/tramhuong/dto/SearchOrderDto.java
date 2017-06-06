package com.tramhuong.dto;

import java.util.Date;

/**
 * Created by PhuongTN1 on 11/4/2016.
 */
public class SearchOrderDto {

    private byte status;
    private Integer paymentType;
    private Integer shippingType;
    private String name;
    private String tel;
    private String email;
    private Date orderDate;
    private String orderCode;
    private String dateSearch;

    public byte getStatus() {
        return status;
    }

    public void setStatus(byte status) {
        this.status = status;
    }

    public Integer getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(Integer paymentType) {
        this.paymentType = paymentType;
    }

    public Integer getShippingType() {
        return shippingType;
    }

    public void setShippingType(Integer shippingType) {
        this.shippingType = shippingType;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public String getOrderCode() {
        return orderCode;
    }

    public void setOrderCode(String orderCode) {
        this.orderCode = orderCode;
    }

    public String getDateSearch() {
        return dateSearch;
    }

    public void setDateSearch(String dateSearch) {
        this.dateSearch = dateSearch;
    }
}
