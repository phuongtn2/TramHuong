package com.tramhuong.mapper;

import com.tramhuong.dto.AboutDto;
import org.apache.ibatis.annotations.Param;


/**
 * Created by PhuongTN1 on 11/4/2016.
 */
public interface AboutMapper {
    int add(@Param("dto") AboutDto aboutDto);
    void update(@Param("dto") AboutDto aboutDto);
    AboutDto find();
}
