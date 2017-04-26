package com.tramhuong.services;

import com.tramhuong.dto.BillingAccountDto;
import com.tramhuong.services.error.ServiceException;
import java.util.List;

/**
 * Created by PhuongTN1 on 11/4/2016.
 */
public interface BillingAccountService {
    long add(BillingAccountDto billingAccountDto) throws ServiceException;
    void delete(long id) throws ServiceException;
    void update(BillingAccountDto billingAccountDto) throws ServiceException;
    List<BillingAccountDto> findAll() throws ServiceException;
    BillingAccountDto findById(long id) throws ServiceException;
}
