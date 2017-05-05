package com.tramhuong.services.impl;

import com.tramhuong.dto.MailTemplateDto;
import com.tramhuong.mapper.MailTemplateMapper;
import com.tramhuong.services.MailTemplateService;
import com.tramhuong.services.error.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by PhuongTN1 on 11/4/2016.
 */
@Service
public class MailTemplateServiceImpl implements MailTemplateService {

    @Autowired
    private MailTemplateMapper mailTemplateMapper;
    @Override
    public int add(MailTemplateDto mailTemplateDto) throws ServiceException {
        return mailTemplateMapper.add(mailTemplateDto);
    }

    @Override
    public void update(MailTemplateDto mailTemplateDto) throws ServiceException {
        mailTemplateMapper.update(mailTemplateDto);
    }

    @Override
    public MailTemplateDto findById(int id) throws ServiceException {
        return mailTemplateMapper.findById(id);
    }

    @Override
    public MailTemplateDto findByCode(String code) throws ServiceException {
        return mailTemplateMapper.findByCode(code);
    }

    @Override
    public List<MailTemplateDto> findAll() throws ServiceException {
        return mailTemplateMapper.findAll();
    }
}
