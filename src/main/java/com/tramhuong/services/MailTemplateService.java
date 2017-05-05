package com.tramhuong.services;

import com.tramhuong.dto.MailTemplateDto;
import com.tramhuong.services.error.ServiceException;

import java.util.List;

/**
 * Created by PhuongTN1 on 11/4/2016.
 */
public interface MailTemplateService {
    int add(MailTemplateDto mailTemplateDto) throws ServiceException;
    void update(MailTemplateDto mailTemplateDto) throws ServiceException;
    MailTemplateDto findById(int id) throws ServiceException;
    MailTemplateDto findByCode(String code) throws ServiceException;
    List<MailTemplateDto> findAll() throws ServiceException;
}
