package com.tramhuong.mapper;

import com.tramhuong.dto.BillingAccountDto;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by PhuongTN1 on 11/4/2016.
 */
public interface BillingAccountMapper {
    long add(@Param("dto") BillingAccountDto billingAccountDto);
    void delete(@Param("id") long id);
    void update(@Param("dto") BillingAccountDto billingAccountDto);
    List<BillingAccountDto> findAll();
    BillingAccountDto findById(@Param("id") long id);
}
