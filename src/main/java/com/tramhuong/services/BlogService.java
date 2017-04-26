package com.tramhuong.services;

import com.tramhuong.dto.BlogDto;
import com.tramhuong.services.error.ServiceException;

import java.util.List;

/**
 * Created by PhuongTN1 on 11/4/2016.
 */
public interface BlogService {
    int add(BlogDto blogDto) throws ServiceException;
    void update(BlogDto blogDto) throws ServiceException;
    void delete(int id) throws ServiceException;
    BlogDto findById(int id) throws ServiceException;
    List<BlogDto> findAll() throws ServiceException;
    List<BlogDto> findByStatus(byte status) throws ServiceException;
}
