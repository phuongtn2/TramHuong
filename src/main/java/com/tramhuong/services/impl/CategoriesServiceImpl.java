package com.tramhuong.services.impl;

import com.controller.memoizer.Memoizer;
import com.tramhuong.dto.CategoryDto;
import com.tramhuong.mapper.CategoriesMapper;
import com.tramhuong.mapper.SubCategoriesMapper;
import com.tramhuong.services.CategoriesService;
import com.tramhuong.services.error.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.function.Function;

/**
 * Created by PhuongTN1 on 11/4/2016.
 */
@Service
public class CategoriesServiceImpl implements CategoriesService {
    @Autowired
    CategoriesMapper categoriesMapper;
    @Autowired
    SubCategoriesMapper subCategoriesMapper;

    /*Function<CategoryDto, Long> fMemoizerCategory = this::add;
    Function<CategoryDto, Long> gMemoizerCategory = Memoizer.memoize(fMemoizerCategory);*/
    @Override
    public long add(CategoryDto categoryDto){
        return categoriesMapper.add(categoryDto);
    }

    @Override
    public void delete(long id) throws ServiceException {
        categoriesMapper.delete(id);
    }

    @Override
    public void update(CategoryDto categoryDto) throws ServiceException {
        categoriesMapper.update(categoryDto);
    }

    /*Function<Byte, List<CategoryDto>> fMemoizerCategoryStatus = this::findByStatus;
    Function<Byte, List<CategoryDto>> gMemoizerCategoryStatus = Memoizer.memoize(fMemoizerCategoryStatus);*/
    @Override
    public List<CategoryDto> findByStatus(byte status){
        return categoriesMapper.findByStatus(status);
    }

   /* @Override
    public List<CategoryDto> findByStatusMemoizer(byte status) {
        return gMemoizerCategoryStatus.apply(status);
    }*/

    @Override
    public List<CategoryDto> findAll() throws ServiceException {
        return categoriesMapper.findAll();
    }

    @Override
    public CategoryDto findById(long id) throws ServiceException {
        return categoriesMapper.findById(id);
    }

    @Override
    public long addS(CategoryDto categoryDto) throws ServiceException {
        return subCategoriesMapper.add(categoryDto);
    }

    @Override
    public void deleteS(long id) throws ServiceException {
        subCategoriesMapper.delete(id);
    }

    @Override
    public void updateS(CategoryDto categoryDto) throws ServiceException {
        subCategoriesMapper.update(categoryDto);
    }

    @Override
    public List<CategoryDto> findByStatusS(byte status){
        return subCategoriesMapper.findByStatus(status);
    }

    /*Function<Byte, List<CategoryDto>> fMemoizerSubCategoryStatus = this::findByStatusS;
    Function<Byte, List<CategoryDto>> gMemoizerSubCategoryStatus = Memoizer.memoize(fMemoizerSubCategoryStatus);
    @Override
    public List<CategoryDto> findByStatusSMemoizer(byte status) {
        return gMemoizerSubCategoryStatus.apply(status);
    }*/

    @Override
    public List<CategoryDto> findAllS() throws ServiceException {
        return subCategoriesMapper.findAll();
    }

    @Override
    public CategoryDto findByIdS(long id) throws ServiceException {
        return subCategoriesMapper.findById(id);
    }

    @Override
    public List<CategoryDto> findByParent(long id){
        return subCategoriesMapper.findByParent(id);
    }

    /*Function<Long, List<CategoryDto>> fMemoizerByParent = this::findByParent;
    Function<Long, List<CategoryDto>> gMemoizerByParent = Memoizer.memoize(fMemoizerByParent);
    @Override
    public List<CategoryDto> findByParentMemoizer(long id) {
        return gMemoizerByParent.apply(id);
    }*/
}
