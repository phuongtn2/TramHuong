package com.tramhuong.services.impl;

import com.tramhuong.dto.StaticDto;
import com.tramhuong.dto.TermDto;
import com.tramhuong.mapper.StaticMapper;
import com.tramhuong.services.StaticService;
import com.tramhuong.services.error.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by PhuongTN1 on 11/4/2016.
 */
@Service
public class StaticServiceImpl implements StaticService {

    @Autowired
    private StaticMapper staticMapper;

    @Override
    public int add(StaticDto staticDto) throws ServiceException {
        return staticMapper.add(staticDto);
    }

    @Override
    public void update(StaticDto staticDto) throws ServiceException {
        staticMapper.update(staticDto);
    }

    @Override
    public StaticDto find(int type) throws ServiceException {
        return staticMapper.findByType(type);
    }

    @Override
    public List<StaticDto> findAll() throws ServiceException {
        return staticMapper.findAll();
    }
}
