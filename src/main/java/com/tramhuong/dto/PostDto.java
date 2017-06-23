package com.tramhuong.dto;

import org.springframework.web.multipart.MultipartFile;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by PhuongTN1 on 11/4/2016.
 */
public class PostDto {
    private Long id;
    private String title;
    private Byte isHigh;
    private String sHigh;
    private String content;
    private String subContent;
    private String url;
    private Date created;
    private String dateDisplay;
    private String img;
    private byte status;
    private MultipartFile file;
    private String source;
    private String tag;

    public void setIsHigh(byte isHigh) {
        this.isHigh = isHigh;
    }

    public String getsHigh() {
        return sHigh;
    }

    public void setsHigh(String sHigh) {
        this.sHigh = sHigh;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
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
            return tag;
        }
    }

    public List<String> getTagList() {
        return tagList;
    }

    public void setTagList(List<String> tagList) {
        this.tagList = tagList;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    private List<String> tagList;

    public Byte getIsHigh() {
        if(isHigh == null) {
            if (sHigh != null) {
                return 1;
            } else {
                return 0;
            }
        }else{
            return isHigh;
        }
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
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

    public String getSubContent() {
        return subContent;
    }

    public void setSubContent(String subContent) {
        this.subContent = subContent;
    }

    public String getDateDisplay() {
        if(created != null)
            return new SimpleDateFormat("MM/dd/yyyy").format(created);
        else
            return "";
    }

    public void setDateDisplay(String dateDisplay) {
        this.dateDisplay = dateDisplay;
    }

    public byte getStatus() {
        return status;
    }

    public void setStatus(byte status) {
        this.status = status;
    }

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }
}
