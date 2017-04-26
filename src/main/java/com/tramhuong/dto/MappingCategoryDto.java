package com.tramhuong.dto;

import java.util.List;

/**
 * Created by PhuongTN1 on 11/4/2016.
 */
public class MappingCategoryDto {
    private CategoryDto categoryDto;
    private List<CategoryDto> suCategories;
    private int subSize;

    public CategoryDto getCategoryDto() {
        return categoryDto;
    }

    public void setCategoryDto(CategoryDto categoryDto) {
        this.categoryDto = categoryDto;
    }

    public List<CategoryDto> getSuCategories() {
        return suCategories;
    }

    public void setSuCategories(List<CategoryDto> suCategories) {
        this.suCategories = suCategories;
    }

    public int getSubSize() {
        return subSize;
    }

    public void setSubSize(int subSize) {
        this.subSize = subSize;
    }
}
