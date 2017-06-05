package com.tramhuong.mapper;

import com.tramhuong.dto.StaticDto;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 * Created by PhuongTN1 on 11/4/2016.
 */
public interface StaticMapper {
    int add(@Param("dto") StaticDto staticDto);
    void update(@Param("dto") StaticDto staticDto);
    StaticDto findByType(@Param("type") Integer type);
    List<StaticDto> findAll();
}
