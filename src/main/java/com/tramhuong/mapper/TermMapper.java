package com.tramhuong.mapper;

import com.tramhuong.dto.TermDto;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 * Created by PhuongTN1 on 11/4/2016.
 */
public interface TermMapper {
    int add(@Param("dto") TermDto termDto);
    void update(@Param("dto") TermDto termDto);
    TermDto findByType(@Param("type") int type);
    List<TermDto> findAll();
}
