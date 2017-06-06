package com.tramhuong.dto;

/**
 * Created by PhuongTN1 on 11/4/2016.
 */
public class ChartDto {
    private Integer value;
    private String label;
    private Integer percent;

    public Integer getValue() {
        return value;
    }

    public void setValue(Integer value) {
        this.value = value;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public Integer getPercent() {
        return percent;
    }

    public void setPercent(Integer percent) {
        this.percent = percent;
    }
}
