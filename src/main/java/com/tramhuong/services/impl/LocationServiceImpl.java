package com.tramhuong.services.impl;

import com.tramhuong.dto.LocationDto;
import com.tramhuong.mapper.LocationMapper;
import com.tramhuong.services.LocationService;
import com.tramhuong.services.error.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by PhuongTN1 on 11/4/2016.
 */
@Service
public class LocationServiceImpl implements LocationService {
    @Autowired
    private LocationMapper locationMapper;

    @Override
    public List<LocationDto> findProvinces() throws ServiceException {
        return locationMapper.findProvinces();
    }

    @Override
    public List<LocationDto> findDistricts(Integer id) throws ServiceException {
        return locationMapper.findDistricts(id);
    }

    @Override
    public List<LocationDto> findWards(Integer id) throws ServiceException {
        return locationMapper.findWards(id);
    }
}
