package com.tramhuong.mapper;

import com.tramhuong.dto.TagDto;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 * Created by PhuongTN1 on 11/4/2016.
 */
public interface TagMapper {
    int add(@Param("dto") TagDto tagDto);
    void update(@Param("dto") TagDto tagDto);
    void delete(@Param("id") int id);
    TagDto findById(@Param("id") int id);
    List<TagDto> findAll();
    List<TagDto> findByStatus(@Param("status") byte status);
}
