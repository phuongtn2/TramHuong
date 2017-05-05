package com.controller;

import com.tramhuong.dto.IntroduceDto;
import com.tramhuong.dto.MailTemplateDto;
import com.tramhuong.dto.MappingCategoryDto;
import com.tramhuong.services.*;
import com.tramhuong.services.error.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

@Controller
public class MailController {
	@Autowired
	private MailTemplateService mailTemplateService;
	@RequestMapping(value = "/admin/mails", method = RequestMethod.GET)
	public String initForm(ModelMap model) throws ServiceException {
		List<MailTemplateDto> mailTemplateDtos = mailTemplateService.findAll();
		if(mailTemplateDtos != null){
			model.addAttribute("mails", mailTemplateDtos);
		}else{
			model.addAttribute("mails", new ArrayList<MailTemplateDto>());
		}
		return "mails";
	}

	@RequestMapping(value = "/admin/mail", method = RequestMethod.GET)
	public String redirectAdd(ModelMap model) throws ServiceException {
		model.addAttribute("mail", new MailTemplateDto());
		return "mail-add";
	}

	@RequestMapping(value = "/admin/mail/edit/{id}", method = RequestMethod.GET)
	public String redirectEdit(ModelMap model, @PathVariable int id) throws ServiceException {
		model.addAttribute("mail", mailTemplateService.findById(id));
		return "mail-add";
	}

	@RequestMapping(value = "/admin/mail/save", method = RequestMethod.POST)
	public String saveMail(ModelMap model, @ModelAttribute("mail") MailTemplateDto mailTemplateDto) throws ServiceException {
		if(mailTemplateDto.getId() > 0)
			mailTemplateService.update(mailTemplateDto);
		else
			mailTemplateService.add(mailTemplateDto);
		return "redirect:/admin/mails";
	}
}
