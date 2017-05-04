package com.tramhuong.dto;

import java.util.Date;

/**
 * Created by PhuongTN1 on 11/4/2016.
 */
public class SearchProductDto {

    private String name;
    private String code;
    private byte sNew;
    private byte sSale;
    private byte sEffete;
    private String isNew;
    private String isSale;
    private String isEffete;
    private long categoryId;
    private long subCategoryId;
    private byte status;
    private Date created;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public byte getsNew() {
        if(isNew != null){
            return 1;
        }else{
            return 0;
        }
    }

    public void setsNew(byte sNew) {
        this.sNew = sNew;
    }

    public byte getsSale() {
        if(isSale != null){
            return 1;
        }else{
            return 0;
        }
    }

    public void setsSale(byte sSale) {
        this.sSale = sSale;
    }

    public byte getsEffete() {
        if(isEffete != null){
            return 1;
        }else{
            return 0;
        }
    }

    public void setsEffete(byte sEffete) {
        this.sEffete = sEffete;
    }

    public String getIsNew() {
        return isNew;
    }

    public void setIsNew(String isNew) {
        this.isNew = isNew;
    }

    public String getIsSale() {
        return isSale;
    }

    public void setIsSale(String isSale) {
        this.isSale = isSale;
    }

    public String getIsEffete() {
        return isEffete;
    }

    public void setIsEffete(String isEffete) {
        this.isEffete = isEffete;
    }

    public long getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(long categoryId) {
        this.categoryId = categoryId;
    }

    public long getSubCategoryId() {
        return subCategoryId;
    }

    public void setSubCategoryId(long subCategoryId) {
        this.subCategoryId = subCategoryId;
    }

    public byte getStatus() {
        return status;
    }

    public void setStatus(byte status) {
        this.status = status;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }
}
