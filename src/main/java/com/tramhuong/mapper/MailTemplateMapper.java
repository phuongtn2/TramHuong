package com.tramhuong.mapper;

import com.tramhuong.dto.MailTemplateDto;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 * Created by PhuongTN1 on 11/4/2016.
 */
public interface MailTemplateMapper {
    int add(@Param("dto") MailTemplateDto mailTemplateDto);
    void update(@Param("dto") MailTemplateDto mailTemplateDto);
    MailTemplateDto findById(@Param("id") int id);
    MailTemplateDto findByCode(@Param("code") String code);
    List<MailTemplateDto> findAll();
}
