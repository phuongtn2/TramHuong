package com.tramhuong.services.impl;

import com.tramhuong.dto.BannerDto;
import com.tramhuong.mapper.BannerMapper;
import com.tramhuong.services.BannerService;
import com.tramhuong.services.error.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by PhuongTN1 on 11/4/2016.
 */
@Service
public class BannerServiceImpl implements BannerService {

    @Autowired
    private BannerMapper bannerMapper;

    @Override
    public int add(BannerDto bannerDto) throws ServiceException {
        return bannerMapper.add(bannerDto);
    }

    @Override
    public void update(BannerDto bannerDto) throws ServiceException {
        bannerMapper.update(bannerDto);
    }

    @Override
    public void delete(int id) throws ServiceException {
        bannerMapper.delete(id);
    }

    @Override
    public BannerDto findById(int id) throws ServiceException {
        return bannerMapper.findById(id);
    }

    @Override
    public List<BannerDto> findAll() throws ServiceException {
        return bannerMapper.findAll();
    }

    @Override
    public List<BannerDto> findByStatus(byte status) throws ServiceException {
        return bannerMapper.findByStatus(status);
    }
}
