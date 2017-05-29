package com.tramhuong.mapper;

import com.tramhuong.dto.ShippingDto;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 * Created by PhuongTN1 on 11/4/2016.
 */
public interface ShippingMapper {
    int add(@Param("dto") ShippingDto shippingDto);
    void update(@Param("dto") ShippingDto shippingDto);
    ShippingDto findById(@Param("id") Integer id);
    List<ShippingDto> findAll();
    List<ShippingDto> findByStatus();
}
