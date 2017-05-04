package com.tramhuong.services.impl;

import com.tramhuong.dto.ProductAddDto;
import com.tramhuong.dto.ProductDto;
import com.tramhuong.dto.SearchProductDto;
import com.tramhuong.mapper.ProductMapper;
import com.tramhuong.services.ProductService;
import com.tramhuong.services.error.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by PhuongTN1 on 11/4/2016.
 */
@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductMapper productMapper;
    @Override
    public long add(ProductAddDto productDto) throws ServiceException {
        return productMapper.add(productDto);
    }

    @Override
    public void delete(long id) throws ServiceException {
        productMapper.delete(id);
    }

    @Override
    public void update(ProductAddDto productDto) throws ServiceException {
        productMapper.update(productDto);
    }

    @Override
    public List<ProductDto> findByStatus(byte status) throws ServiceException {
        return productMapper.findByStatus(status);
    }

    @Override
    public List<ProductDto> findAll() throws ServiceException {
        return productMapper.findAll();
    }

    @Override
    public List<ProductDto> findNew(int limit) throws ServiceException {
        return productMapper.findNew(limit);
    }

    @Override
    public List<ProductDto> findSale(int limit) throws ServiceException {
        return productMapper.findSale(limit);
    }

    @Override
    public List<ProductDto> findByCategory(long id, int limit) throws ServiceException {
        return productMapper.findByCategory(id, limit);
    }

    @Override
    public List<ProductDto> findBySubCategory(long id, int limit) throws ServiceException {
        return productMapper.findBySubCategory(id, limit);
    }

    @Override
    public List<ProductDto> findHighlights(int limit) throws ServiceException {
        return productMapper.findHighlights(limit);
    }

    @Override
    public List<ProductDto> findByTag(String tag) throws ServiceException {
        return productMapper.findByTag(tag);
    }

    @Override
    public List<ProductDto> findByName(String name) throws ServiceException {
        return productMapper.findByName(name);
    }

    @Override
    public ProductDto findById(long id) throws ServiceException {
        return productMapper.findById(id);
    }

    @Override
    public List<ProductDto> findByCondition(SearchProductDto searchProductDto) throws ServiceException {
        return productMapper.findByCondition(searchProductDto);
    }
}
