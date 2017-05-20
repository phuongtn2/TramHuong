package com.tramhuong.services;

import com.tramhuong.dto.ProductAddDto;
import com.tramhuong.dto.ProductDto;
import com.tramhuong.dto.SearchProductDto;
import com.tramhuong.dto.SortDto;
import com.tramhuong.services.error.ServiceException;

import java.util.List;

/**
 * Created by PhuongTN1 on 11/4/2016.
 */
public interface ProductService {
    long add(ProductAddDto productDto) throws ServiceException;
    void delete(long id) throws ServiceException;
    void update(ProductAddDto productDto) throws ServiceException;
    List<ProductDto> findByStatus(byte status) throws ServiceException;
    List<ProductDto> findAll() throws ServiceException;
    List<ProductDto> findNew(int limit) throws ServiceException;
    List<ProductDto> findSale(int limit);
    //List<ProductDto> findSaleMemoizer(int limit);
    List<ProductDto> findByCategory(long id, int limit) throws ServiceException;
    List<ProductDto> findBySubCategory(long id, int limit) throws ServiceException;
    List<ProductDto> findHighlights(int limit);
    //List<ProductDto> findHighlightsMemoizer(int limit);
    List<ProductDto> findByTag(String tag) throws ServiceException;
    List<ProductDto> findByName(String name) throws ServiceException;
    ProductDto findById(long id) throws ServiceException;
    List<ProductDto> findByCondition(SearchProductDto searchProductDto) throws ServiceException;
    List<ProductDto> sort(SortDto sortDto) throws ServiceException;
}
