package com.tramhuong.services.impl;

import com.tramhuong.dto.OrderItemDto;
import com.tramhuong.mapper.OrderItemMapper;
import com.tramhuong.services.OrderItemService;
import com.tramhuong.services.error.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

/**
 * Created by PhuongTN1 on 11/4/2016.
 */
@Service
public class OrderItemServiceImpl implements OrderItemService {

    @Autowired
    private OrderItemMapper orderItemMapper;
    @Override
    public int add(OrderItemDto orderItemDto) throws ServiceException {
        return orderItemMapper.add(orderItemDto);
    }

    @Override
    public List<OrderItemDto> findByOrderCode(String orderCode) throws ServiceException {
        return orderItemMapper.findByOrderCode(orderCode);
    }

    @Override
    public void delete(String orderCode) throws ServiceException {
        orderItemMapper.delete(orderCode);
    }
}
