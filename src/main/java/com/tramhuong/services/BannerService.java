package com.tramhuong.services;

import com.tramhuong.dto.BannerDto;
import com.tramhuong.services.error.ServiceException;

import java.util.List;

/**
 * Created by PhuongTN1 on 11/4/2016.
 */
public interface BannerService {
    int add(BannerDto bannerDto) throws ServiceException;
    void update(BannerDto bannerDto) throws ServiceException;
    void delete(int id) throws ServiceException;
    BannerDto findById(int id) throws ServiceException;
    List<BannerDto> findAll() throws ServiceException;
    List<BannerDto> findByStatus(byte status) throws ServiceException;
}
