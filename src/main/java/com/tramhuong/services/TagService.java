package com.tramhuong.services;

import com.tramhuong.dto.TagDto;
import com.tramhuong.services.error.ServiceException;

import java.util.List;

/**
 * Created by PhuongTN1 on 11/4/2016.
 */
public interface TagService {
    int add(TagDto tagDto) throws ServiceException;
    void update(TagDto tagDto) throws ServiceException;
    void delete(int id) throws ServiceException;
    TagDto findById(int id) throws ServiceException;
    List<TagDto> findAll() throws ServiceException;
    List<TagDto> findByStatus(byte status) throws ServiceException;
}
