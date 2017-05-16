package com.tramhuong.dto;

import org.springframework.web.multipart.MultipartFile;

import java.text.DecimalFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by PhuongTN1 on 11/4/2016.
 */
public class ProductAddDto {
    private Long id;
    private String code;
    private String name;
    private String tag;
    private List<String> tagList;
    private Byte isNew;
    private String sNew;
    private Byte isSale;
    private String sSale;
    private Byte isEffete;
    private String sEffete;
    private String sHigh;
    private Byte isHigh;
    private Date created;
    private MultipartFile file;
    private String img;
    private MultipartFile file1;
    private String img1;
    private MultipartFile file2;
    private String img2;
    private Byte status;
    private Long categoryId;
    private Long subCategoryId;
    private Double price;
    private String priceDisplay;
    private Double salePrice;
    private String salePriceDisplay;
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
        if(tagList != null && tagList.size() >0) {
            String str = "";
            int count = 0;
            for (String s : tagList) {
                count++;
                if (count == tagList.size()) {
                    str = str + s;
                } else {
                    str = str + s + ",";
                }
            }
            return str;
        }else {
            return null;
        }
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public Byte getIsNew() {
        if(sNew != null){
            return 1;
        }else{
            return 0;
        }
    }

    public void setIsNew(Byte isNew) {
        this.isNew = isNew;
    }

    public Byte getIsSale() {
        if(sSale != null){
            return 1;
        }else{
            return 0;
        }
    }

    public void setIsSale(Byte isSale) {
        this.isSale = isSale;
    }

    public Byte getIsEffete() {
        if(sEffete != null){
            return 1;
        }else{
            return 0;
        }
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

    public Long getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Long categoryId) {
        this.categoryId = categoryId;
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

    public String getSalePriceDisplay() {
        DecimalFormat decimalFormat = new DecimalFormat("###,###,###");
        String sPrice = decimalFormat.format(salePrice);
        return sPrice;
    }

    public void setSalePriceDisplay(String salePriceDisplay) {
        this.salePriceDisplay = salePriceDisplay;
    }

    public String getsNew() {
        return sNew;
    }

    public void setsNew(String sNew) {
        this.sNew = sNew;
    }

    public String getsSale() {
        return sSale;
    }

    public void setsSale(String sSale) {
        this.sSale = sSale;
    }

    public String getsEffete() {
        return sEffete;
    }

    public void setsEffete(String sEffete) {
        this.sEffete = sEffete;
    }


    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }

    public MultipartFile getFile1() {
        return file1;
    }

    public void setFile1(MultipartFile file1) {
        this.file1 = file1;
    }

    public MultipartFile getFile2() {
        return file2;
    }

    public void setFile2(MultipartFile file2) {
        this.file2 = file2;
    }

    public String getsHigh() {
        return sHigh;
    }

    public void setsHigh(String sHigh) {
        this.sHigh = sHigh;
    }

    public Byte getIsHigh() {
        if(sHigh != null){
            return 1;
        }else{
            return 0;
        }
    }

    public void setIsHigh(Byte isHigh) {
        this.isHigh = isHigh;
    }

    public List<String> getTagList() {
        return tagList;
    }

    public void setTagList(List<String> tagList) {
        this.tagList = tagList;
    }
}
