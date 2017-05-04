package com.controller;

import com.tramhuong.dto.AboutDto;
import com.tramhuong.dto.IntroduceDto;
import com.tramhuong.dto.MappingCategoryDto;
import com.tramhuong.services.AboutService;
import com.tramhuong.services.error.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.List;

@Controller
public class AboutController {
	@Autowired
	private AboutService aboutService;
	@RequestMapping(value = "/admin/about", method = RequestMethod.GET)
	public String initForm(ModelMap model) throws ServiceException {
		AboutDto aboutDto = aboutService.find();
		if(aboutDto != null){
			model.addAttribute("about", aboutDto);
		}else{
			model.addAttribute("about", new AboutDto());
		}
		return "about";
	}
	@RequestMapping(method = RequestMethod.POST, params = "updateAbout")
	public String addAbout(@ModelAttribute("about") AboutDto aboutDto) throws ServiceException {
		if(aboutDto.getId() != null && aboutDto.getId() > 0){
			aboutService.update(aboutDto);
		}else{
			aboutService.add(aboutDto);
		}
		return "redirect:/admin/about";
	}
}
