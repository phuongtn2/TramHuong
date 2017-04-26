package com.tramhuong.dto;

/**
 * Created by PhuongTN1 on 11/4/2016.
 */
public class BillingAccountDto {
    private Integer id;
    private String description;
    private String accountName;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }
}
