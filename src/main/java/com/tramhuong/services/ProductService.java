package com.tramhuong.services;

import com.tramhuong.dto.ProductDto;
import com.tramhuong.services.error.ServiceException;

import java.util.List;

/**
 * Created by PhuongTN1 on 11/4/2016.
 */
public interface ProductService {
    long add(ProductDto productDto) throws ServiceException;
    void delete(long id) throws ServiceException;
    void update(ProductDto productDto) throws ServiceException;
    List<ProductDto> findByStatus(byte status) throws ServiceException;
    List<ProductDto> findAll() throws ServiceException;
    List<ProductDto> findNew(int limit) throws ServiceException;
    List<ProductDto> findSale(int limit) throws ServiceException;
    List<ProductDto> findByCategory(long id, int limit) throws ServiceException;
    List<ProductDto> findBySubCategory(long id, int limit) throws ServiceException;
    List<ProductDto> findHighlights(int limit) throws ServiceException;
    ProductDto findById(long id) throws ServiceException;

}
