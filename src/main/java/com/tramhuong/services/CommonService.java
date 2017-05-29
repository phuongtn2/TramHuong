package com.tramhuong.services;

import com.tramhuong.dto.PaymentDto;
import com.tramhuong.dto.ShippingDto;
import com.tramhuong.services.error.ServiceException;

import java.util.List;

/**
 * Created by PhuongTN1 on 11/4/2016.
 */
public interface CommonService {
    // For payment
    int addPayment(PaymentDto paymentDto) throws ServiceException;
    void updatePayment(PaymentDto paymentDto) throws ServiceException;
    PaymentDto findByIdPayment(Integer id) throws ServiceException;
    List<PaymentDto> findAllPayment() throws ServiceException;
    List<PaymentDto> findByStatusPayment() throws ServiceException;
    // For shipping
    int addShipping(ShippingDto shippingDto) throws ServiceException;
    void updateShipping(ShippingDto shippingDto) throws ServiceException;
    ShippingDto findByIdShipping(Integer id) throws ServiceException;
    List<ShippingDto> findAllShipping() throws ServiceException;
    List<ShippingDto> findByStatusShipping() throws ServiceException;
}
