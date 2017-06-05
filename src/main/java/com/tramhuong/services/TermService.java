package com.tramhuong.services;

import com.tramhuong.dto.TermDto;
import com.tramhuong.services.error.ServiceException;

/**
 * Created by PhuongTN1 on 11/4/2016.
 */
public interface TermService {
    int add(TermDto termDto) throws ServiceException;
    void update(TermDto termDto) throws ServiceException;
    TermDto find() throws ServiceException;
}
