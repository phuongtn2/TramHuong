package com.tramhuong.mapper;

import com.tramhuong.dto.BlogDto;
import com.tramhuong.dto.OrderInfoDto;
import com.tramhuong.services.error.ServiceException;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;


/**
 * Created by PhuongTN1 on 11/4/2016.
 */
public interface OrderMapper {
    long add(@Param("dto") OrderInfoDto orderInfoDto);
    void update(@Param("dto") OrderInfoDto orderInfoDto);
    void delete(@Param("orderCode") String orderCode) throws ServiceException;
    OrderInfoDto findById(@Param("id") long id);
    List<OrderInfoDto> findAll();
    List<OrderInfoDto> findByCondition(@Param("status") byte status,@Param("orderCode") String orderCode,@Param("paymentType") byte paymentType,
                                       @Param("dateSearch") String orderDate, @Param("name")String name, @Param("tel") String tel, @Param("email") String email);
}
