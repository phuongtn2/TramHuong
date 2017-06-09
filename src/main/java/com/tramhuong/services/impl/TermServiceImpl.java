package com.tramhuong.services.impl;

import com.tramhuong.dto.TermDto;
import com.tramhuong.mapper.TermMapper;
import com.tramhuong.services.TermService;
import com.tramhuong.services.error.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by PhuongTN1 on 11/4/2016.
 */
@Service
public class TermServiceImpl implements TermService {

    @Autowired
    private TermMapper termMapper;


    @Override
    public int add(TermDto termDto) throws ServiceException {
        return termMapper.add(termDto);
    }

    @Override
    public void update(TermDto termDto) throws ServiceException {
        termMapper.update(termDto);
    }

    @Override
    public TermDto findByType(int type) throws ServiceException {
        return termMapper.findByType(type);
    }

    @Override
    public List<TermDto> findAll() throws ServiceException {
        return termMapper.findAll();
    }
}
