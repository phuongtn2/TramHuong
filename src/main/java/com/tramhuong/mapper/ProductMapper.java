package com.tramhuong.mapper;

import com.tramhuong.dto.CategoryDto;
import com.tramhuong.dto.ProductAddDto;
import com.tramhuong.dto.ProductDto;
import com.tramhuong.dto.SearchProductDto;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by PhuongTN1 on 11/4/2016.
 */
public interface ProductMapper {
    long add(@Param("dto") ProductAddDto productDto);
    void delete(@Param("id") long id);
    void update(@Param("dto") ProductAddDto productDto);
    List<ProductDto> findByStatus(@Param("status")byte status);
    List<ProductDto> findAll();
    List<ProductDto> findNew(@Param("limit") int limit);
    List<ProductDto> findSale(@Param("limit") int limit);
    List<ProductDto> findByCategory(@Param("id") long id, @Param("limit") int limit);
    List<ProductDto> findBySubCategory(@Param("id") long id, @Param("limit") int limit);
    List<ProductDto> findHighlights(@Param("limit") int limit);
    List<ProductDto> findByTag(@Param("tag") String tag);
    List<ProductDto> findByName(@Param("name") String name);
    ProductDto findById(@Param("id") long id);
    List<ProductDto> findByCondition(@Param("dto")SearchProductDto searchProductDto);
}
