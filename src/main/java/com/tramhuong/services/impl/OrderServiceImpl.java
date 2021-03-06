package com.tramhuong.services.impl;

import com.tramhuong.dto.ChartDto;
import com.tramhuong.dto.OrderInfoDto;
import com.tramhuong.mapper.OrderMapper;
import com.tramhuong.services.OrderService;
import com.tramhuong.services.error.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by PhuongTN1 on 11/4/2016.
 */
@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderMapper orderMapper;
    @Override
    public long add(OrderInfoDto orderInfoDto) throws ServiceException {
        return orderMapper.add(orderInfoDto);
    }

    @Override
    public void update(OrderInfoDto orderInfoDto) throws ServiceException {
        orderMapper.update(orderInfoDto);
    }

    @Override
    public void delete(String orderCode) throws ServiceException {
        orderMapper.delete(orderCode);
    }

    @Override
    public OrderInfoDto findById(long id) throws ServiceException {
        return orderMapper.findById(id);
    }

    @Override
    public List<OrderInfoDto> findAll() throws ServiceException {
        return orderMapper.findAll();
    }

    @Override
    public List<OrderInfoDto> findNew() throws ServiceException {
        return orderMapper.findNew();
    }

    @Override
    public Long findOrderCancel() throws ServiceException {
        return orderMapper.findOrderCancel();
    }

    @Override
    public Long findOrderThisDay() throws ServiceException {
        return orderMapper.findOrderThisDay();
    }

    @Override
    public List<OrderInfoDto> findPayment() throws ServiceException {
        return orderMapper.findPayment();
    }

    @Override
    public List<ChartDto> chart() throws ServiceException {
        return orderMapper.chart();
    }

    @Override
    public List<OrderInfoDto> findByCondition(byte status, String orderCode, Integer paymentType, Integer shippingType, String orderDate, String name, String tel, String email) throws ServiceException {
        return orderMapper.findByCondition(status, orderCode, paymentType, shippingType,  orderDate, name, tel, email);
    }
}
