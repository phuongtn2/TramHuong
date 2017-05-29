package com.tramhuong.dto;

import java.text.DecimalFormat;

/**
 * Created by PhuongTN1 on 11/4/2016.
 */
public class ShippingDto {
    private Integer id;
    private String info;
    private Byte status;
    private Integer position;
    private Double shippingCost;
    private String costDisplay;
    private String name;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public Byte getStatus() {
        return status;
    }

    public void setStatus(Byte status) {
        this.status = status;
    }

    public Integer getPosition() {
        return position;
    }

    public void setPosition(Integer position) {
        this.position = position;
    }

    public Double getShippingCost() {
        if(shippingCost == null)
            return 0.0;
        else
            return shippingCost;
    }

    public void setShippingCost(Double shippingCost) {
        this.shippingCost = shippingCost;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCostDisplay() {
        if(shippingCost != null) {
            DecimalFormat decimalFormat = new DecimalFormat("###,###,###");
            String cost = decimalFormat.format(shippingCost);
            return cost;
        }else
            return "0";
    }

    public void setCostDisplay(String costDisplay) {
        this.costDisplay = costDisplay;
    }
}
