package com.tramhuong.dto;

import java.util.Date;

/**
 * Created by PhuongTN1 on 11/4/2016.
 */
public class OrderInfoDto {
    private Long id;
    private String name;
    private String tel;
    private String email;
    private String address;
    private Integer provinceId;
    private String provinceName;
    private Integer districtId;
    private String districtName;
    private Integer wardId;
    private String wardName;
    private String description;
    private byte paymentType;
    private String orderCode;
    private String totalPrice;
    private Date orderDate;
}
