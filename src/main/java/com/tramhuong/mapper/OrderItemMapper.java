package com.tramhuong.mapper;

import com.tramhuong.dto.OrderItemDto;
import org.apache.ibatis.annotations.Param;
import java.util.List;


/**
 * Created by PhuongTN1 on 11/4/2016.
 */
public interface OrderItemMapper {
    int add(@Param("dto") OrderItemDto orderItemDto);
    List<OrderItemDto> findByOrderCode(@Param("orderCode") String orderCode);
    void delete(@Param("orderCode") String orderCode);
}
