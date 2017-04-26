package com.tramhuong.mapper;

import com.tramhuong.dto.IntroduceDto;
import org.apache.ibatis.annotations.Param;


/**
 * Created by PhuongTN1 on 11/4/2016.
 */
public interface IntroduceMapper {
    int add(@Param("dto") IntroduceDto introduceDto);
    void update(@Param("dto") IntroduceDto introduceDto);
    IntroduceDto find();
}
