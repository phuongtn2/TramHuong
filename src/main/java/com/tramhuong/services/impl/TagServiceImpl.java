package com.tramhuong.services.impl;

import com.tramhuong.dto.TagDto;
import com.tramhuong.mapper.TagMapper;
import com.tramhuong.services.TagService;
import com.tramhuong.services.error.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by PhuongTN1 on 11/4/2016.
 */
@Service
public class TagServiceImpl implements TagService {

    @Autowired
    private TagMapper tagMapper;

    @Override
    public int add(TagDto tagDto) throws ServiceException {
        return tagMapper.add(tagDto);
    }

    @Override
    public void update(TagDto tagDto) throws ServiceException {
        tagMapper.update(tagDto);
    }

    @Override
    public void delete(int id) throws ServiceException {
        tagMapper.delete(id);
    }

    @Override
    public TagDto findById(int id) throws ServiceException {
        return tagMapper.findById(id);
    }

    @Override
    public List<TagDto> findAll() throws ServiceException {
        return tagMapper.findAll();
    }

    @Override
    public List<TagDto> findByStatus(byte status) throws ServiceException {
        return tagMapper.findByStatus(status);
    }
}
