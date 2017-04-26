package com.tramhuong.services.impl;

import com.tramhuong.dto.AboutDto;
import com.tramhuong.mapper.AboutMapper;
import com.tramhuong.services.AboutService;
import com.tramhuong.services.error.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by PhuongTN1 on 11/4/2016.
 */
@Service
public class AboutServiceImpl implements AboutService {

    @Autowired
    private AboutMapper aboutMapper;
    @Override
    public int add(AboutDto aboutDto) throws ServiceException {
        return aboutMapper.add(aboutDto);
    }

    @Override
    public void update(AboutDto aboutDto) throws ServiceException {
        aboutMapper.update(aboutDto);
    }

    @Override
    public AboutDto find() throws ServiceException {
        return aboutMapper.find();
    }
}
