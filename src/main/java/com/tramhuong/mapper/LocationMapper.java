package com.tramhuong.mapper;

import com.tramhuong.dto.IntroduceDto;
import com.tramhuong.dto.LocationDto;
import com.tramhuong.services.error.ServiceException;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 * Created by PhuongTN1 on 11/4/2016.
 */
public interface LocationMapper {
    List<LocationDto> findProvinces();
    List<LocationDto> findDistricts(@Param("id") Integer id);
    List<LocationDto> findWards(@Param("id") Integer id);
}
