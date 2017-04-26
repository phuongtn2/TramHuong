package com.tramhuong.mapper;

import com.tramhuong.dto.CategoryDto;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by PhuongTN1 on 11/4/2016.
 */
public interface CategoriesMapper {
    long add(@Param("dto") CategoryDto categoryDto);
    void delete(@Param("id") long id);
    void update(@Param("dto") CategoryDto CategoryDto);
    List<CategoryDto> findAll();
    List<CategoryDto> findByStatus(@Param("status") byte status);
    CategoryDto findById(@Param("id") long id);
}
