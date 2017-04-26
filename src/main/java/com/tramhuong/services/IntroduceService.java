package com.tramhuong.services;

import com.tramhuong.dto.IntroduceDto;
import com.tramhuong.services.error.ServiceException;

/**
 * Created by PhuongTN1 on 11/4/2016.
 */
public interface IntroduceService {
    int add(IntroduceDto introduceDto) throws ServiceException;
    void update(IntroduceDto introduceDto) throws ServiceException;
    IntroduceDto find() throws ServiceException;
}
