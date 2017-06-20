package com.tramhuong.dto;

import org.springframework.web.multipart.MultipartFile;

/**
 * Created by PhuongTN1 on 11/4/2016.
 */
public class BannerDto {
    private Integer id;
    private String img;
    private Integer position;
    private byte status;
    private MultipartFile file;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public Integer getPosition() {
        return position;
    }

    public void setPosition(Integer position) {
        this.position = position;
    }

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }

    public byte getStatus() {
        return status;
    }

    public void setStatus(byte status) {
        this.status = status;
    }
}
