package com.tramhuong.services.impl;

import com.tramhuong.dto.CategoryDto;
import com.tramhuong.dto.IntroduceDto;
import com.tramhuong.mapper.CategoriesMapper;
import com.tramhuong.mapper.IntroduceMapper;
import com.tramhuong.mapper.SubCategoriesMapper;
import com.tramhuong.services.CategoriesService;
import com.tramhuong.services.IntroduceService;
import com.tramhuong.services.error.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by PhuongTN1 on 11/4/2016.
 */
@Service
public class IntroduceServiceImpl implements IntroduceService {
    @Autowired
    IntroduceMapper introduceMapper;

    @Override
    public int add(IntroduceDto introduceDto) throws ServiceException {
        return introduceMapper.add(introduceDto);
    }

    @Override
    public void update(IntroduceDto introduceDto) throws ServiceException {
        introduceMapper.update(introduceDto);
    }

    @Override
    public IntroduceDto find() throws ServiceException {
        return introduceMapper.find();
    }
}
