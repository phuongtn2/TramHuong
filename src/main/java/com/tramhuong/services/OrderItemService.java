package com.tramhuong.services;

import com.tramhuong.dto.OrderItemDto;
import com.tramhuong.services.error.ServiceException;
import java.util.List;

/**
 * Created by PhuongTN1 on 11/4/2016.
 */
public interface OrderItemService {
    int add(OrderItemDto orderItemDto) throws ServiceException;
    List<OrderItemDto> findByOrderCode(String orderCode) throws ServiceException;
    void delete(String orderCode) throws ServiceException;
}
