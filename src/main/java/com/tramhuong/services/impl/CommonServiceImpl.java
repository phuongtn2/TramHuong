package com.tramhuong.services.impl;

import com.tramhuong.dto.AboutDto;
import com.tramhuong.dto.PaymentDto;
import com.tramhuong.dto.ShippingDto;
import com.tramhuong.mapper.PaymentMapper;
import com.tramhuong.mapper.ShippingMapper;
import com.tramhuong.services.CommonService;
import com.tramhuong.services.error.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by PhuongTN1 on 11/4/2016.
 */
@Service
public class CommonServiceImpl implements CommonService {

    @Autowired
    private PaymentMapper paymentMapper;
    @Autowired
    private ShippingMapper shippingMapper;

    @Override
    public int addPayment(PaymentDto paymentDto) throws ServiceException {
        return paymentMapper.add(paymentDto);
    }

    @Override
    public void updatePayment(PaymentDto paymentDto) throws ServiceException {
        paymentMapper.update(paymentDto);
    }

    @Override
    public PaymentDto findByIdPayment(Integer id) throws ServiceException {
        return paymentMapper.findById(id);
    }

    @Override
    public List<PaymentDto> findAllPayment() throws ServiceException {
        return paymentMapper.findAll();
    }

    @Override
    public List<PaymentDto> findByStatusPayment() throws ServiceException {
        return paymentMapper.findByStatus();
    }

    @Override
    public int addShipping(ShippingDto shippingDto) throws ServiceException {
        return shippingMapper.add(shippingDto);
    }

    @Override
    public void updateShipping(ShippingDto shippingDto) throws ServiceException {
        shippingMapper.update(shippingDto);
    }

    @Override
    public ShippingDto findByIdShipping(Integer id) throws ServiceException {
        return shippingMapper.findById(id);
    }

    @Override
    public List<ShippingDto> findAllShipping() throws ServiceException {
        return shippingMapper.findAll();
    }

    @Override
    public List<ShippingDto> findByStatusShipping() throws ServiceException {
        return shippingMapper.findByStatus();
    }
}
