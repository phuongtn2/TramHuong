package com.tramhuong.services.impl;

import com.tramhuong.dto.BillingAccountDto;
import com.tramhuong.mapper.BillingAccountMapper;
import com.tramhuong.services.BillingAccountService;
import com.tramhuong.services.error.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by PhuongTN1 on 11/4/2016.
 */
@Service
public class BillingAccountServiceImpl implements BillingAccountService {

    @Autowired
    private BillingAccountMapper billingAccountMapper;
    @Override
    public long add(BillingAccountDto billingAccountDto) throws ServiceException {
        return billingAccountMapper.add(billingAccountDto);
    }

    @Override
    public void delete(int id) throws ServiceException {
        billingAccountMapper.delete(id);
    }

    @Override
    public void update(BillingAccountDto billingAccountDto) throws ServiceException {
        billingAccountMapper.update(billingAccountDto);
    }

    @Override
    public List<BillingAccountDto> findAll() throws ServiceException {
        return billingAccountMapper.findAll();
    }

    @Override
    public BillingAccountDto findById(int id) throws ServiceException {
        return billingAccountMapper.findById(id);
    }
}
