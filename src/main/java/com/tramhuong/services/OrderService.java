package com.tramhuong.services;

import com.tramhuong.dto.OrderInfoDto;
import com.tramhuong.services.error.ServiceException;

import java.util.Date;
import java.util.List;

/**
 * Created by PhuongTN1 on 11/4/2016.
 */
public interface OrderService {
    long add(OrderInfoDto orderInfoDto) throws ServiceException;
    void update(OrderInfoDto orderInfoDto) throws ServiceException;
    void delete(String orderCode) throws ServiceException;
    OrderInfoDto findById(long id) throws ServiceException;
    List<OrderInfoDto> findAll() throws ServiceException;
    List<OrderInfoDto> findByCondition(byte status, String orderCode, byte paymentType,
                                       String orderDate, String name, String tel, String email) throws ServiceException;
}
