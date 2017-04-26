package com.tramhuong.services;

import com.tramhuong.dto.LocationDto;
import com.tramhuong.services.error.ServiceException;

import java.util.List;

/**
 * Created by PhuongTN1 on 11/4/2016.
 */
public interface LocationService {
    List<LocationDto> findProvinces() throws ServiceException;
    List<LocationDto> findDistricts(Integer id) throws ServiceException;
    List<LocationDto> findWards(Integer id) throws ServiceException;
}
