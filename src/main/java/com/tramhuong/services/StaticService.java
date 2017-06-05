package com.tramhuong.services;

import com.tramhuong.dto.StaticDto;
import com.tramhuong.services.error.ServiceException;

import java.util.List;

/**
 * Created by PhuongTN1 on 11/4/2016.
 */
public interface StaticService {
    int add(StaticDto staticDto) throws ServiceException;
    void update(StaticDto staticDto) throws ServiceException;
    StaticDto find(int type) throws ServiceException;
    List<StaticDto> findAll() throws ServiceException;
}
