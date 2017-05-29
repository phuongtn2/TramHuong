package com.tramhuong.mapper;

import com.tramhuong.dto.PaymentDto;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 * Created by PhuongTN1 on 11/4/2016.
 */
public interface PaymentMapper {
    int add(@Param("dto") PaymentDto paymentDto);
    void update(@Param("dto") PaymentDto paymentDto);
    PaymentDto findById(@Param("id") Integer id);
    List<PaymentDto> findAll();
    List<PaymentDto> findByStatus();
}
