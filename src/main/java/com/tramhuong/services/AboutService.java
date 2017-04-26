package com.tramhuong.services;

import com.tramhuong.dto.AboutDto;
import com.tramhuong.services.error.ServiceException;

/**
 * Created by PhuongTN1 on 11/4/2016.
 */
public interface AboutService {
    int add(AboutDto aboutDto) throws ServiceException;
    void update(AboutDto aboutDto) throws ServiceException;
    AboutDto find() throws ServiceException;
}
