package com.tramhuong.mapper;

import com.tramhuong.dto.BlogDto;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 * Created by PhuongTN1 on 11/4/2016.
 */
public interface BlogMapper {
    int add(@Param("dto") BlogDto blogDto);
    void update(@Param("dto") BlogDto blogDto);
    void delete(@Param("id") int id);
    BlogDto findById(@Param("id") int id);
    List<BlogDto> findAll();
    List<BlogDto> findByStatus(@Param("status") byte status);
}
