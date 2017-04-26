package com.tramhuong.services.impl;

import com.tramhuong.dto.CategoryDto;
import com.tramhuong.mapper.CategoriesMapper;
import com.tramhuong.mapper.SubCategoriesMapper;
import com.tramhuong.services.CategoriesService;
import com.tramhuong.services.error.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by PhuongTN1 on 11/4/2016.
 */
@Service
public class CategoriesServiceImpl implements CategoriesService {
    @Autowired
    CategoriesMapper categoriesMapper;
    @Autowired
    SubCategoriesMapper subCategoriesMapper;

    @Override
    public long add(CategoryDto categoryDto) throws ServiceException {
        return 0;
    }

    @Override
    public void delete(long id) throws ServiceException {

    }

    @Override
    public void update(CategoryDto categoryDto) throws ServiceException {

    }

    @Override
    public List<CategoryDto> findByStatus(byte status) throws ServiceException {
        return categoriesMapper.findByStatus(status);
    }

    @Override
    public List<CategoryDto> findAll() throws ServiceException {
        return categoriesMapper.findAll();
    }

    @Override
    public CategoryDto findById(long id) throws ServiceException {
        return null;
    }

    @Override
    public long addS(CategoryDto categoryDto) throws ServiceException {
        return 0;
    }

    @Override
    public void deleteS(long id) throws ServiceException {

    }

    @Override
    public void updateS(CategoryDto categoryDto) throws ServiceException {

    }

    @Override
    public List<CategoryDto> findByStatusS(byte status) throws ServiceException {
        return subCategoriesMapper.findByStatus(status);
    }

    @Override
    public List<CategoryDto> findAllS() throws ServiceException {
        return subCategoriesMapper.findAll();
    }

    @Override
    public CategoryDto findByIdS(long id) throws ServiceException {
        return null;
    }

    @Override
    public List<CategoryDto> findByParent(long id) throws ServiceException {
        return subCategoriesMapper.findByParent(id);
    }
}
