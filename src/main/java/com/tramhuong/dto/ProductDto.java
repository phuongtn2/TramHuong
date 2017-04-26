package com.tramhuong.dto;

import java.text.DecimalFormat;
import java.util.Date;

/**
 * Created by PhuongTN1 on 11/4/2016.
 */
public class ProductDto {
    private Long id;
    private String code;
    private String name;
    private String tag;
    private Byte isNew;
    private Byte isSale;
    private Byte isEffete;
    private Date created;
    private String img;
    private String img1;
    private String img2;
    private Byte status;
    private Long cateGoryId;
    private Long subCategoryId;
    private Double price;
    private String priceDisplay;
    private Double salePrice;
    private String description;
    private Integer count;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public Byte getIsNew() {
        return isNew;
    }

    public void setIsNew(Byte isNew) {
        this.isNew = isNew;
    }

    public Byte getIsSale() {
        return isSale;
    }

    public void setIsSale(Byte isSale) {
        this.isSale = isSale;
    }

    public Byte getIsEffete() {
        return isEffete;
    }

    public void setIsEffete(Byte isEffete) {
        this.isEffete = isEffete;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getImg1() {
        return img1;
    }

    public void setImg1(String img1) {
        this.img1 = img1;
    }

    public String getImg2() {
        return img2;
    }

    public void setImg2(String img2) {
        this.img2 = img2;
    }

    public Byte getStatus() {
        return status;
    }

    public void setStatus(Byte status) {
        this.status = status;
    }

    public Long getCateGoryId() {
        return cateGoryId;
    }

    public void setCateGoryId(Long cateGoryId) {
        this.cateGoryId = cateGoryId;
    }

    public Long getSubCategoryId() {
        return subCategoryId;
    }

    public void setSubCategoryId(Long subCategoryId) {
        this.subCategoryId = subCategoryId;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Double getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(Double salePrice) {
        this.salePrice = salePrice;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public String getPriceDisplay() {
        DecimalFormat decimalFormat = new DecimalFormat("###,###,###");
        String sPrice = decimalFormat.format(price);
        return sPrice;
    }

    public void setPriceDisplay(String priceDisplay) {
        this.priceDisplay = priceDisplay;
    }
}
