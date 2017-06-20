package com.tramhuong.mapper;

import com.tramhuong.dto.BannerDto;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 * Created by PhuongTN1 on 11/4/2016.
 */
public interface BannerMapper {
    int add(@Param("dto") BannerDto bannerDto);
    void update(@Param("dto") BannerDto bannerDto);
    void delete(@Param("id") int id);
    BannerDto findById(@Param("id") int id);
    List<BannerDto> findAll();
    List<BannerDto> findByStatus(@Param("status") byte status);
}
