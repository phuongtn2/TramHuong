package com.controller;

import com.controller.memoizer.Memoizer;
import com.tramhuong.dto.AboutDto;
import com.tramhuong.services.AboutService;
import com.tramhuong.services.error.ServiceException;
import org.cache2k.Cache;
import org.cache2k.Cache2kBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
public class AboutController {
	@Autowired
	private AboutService aboutService;
	@RequestMapping(value = "/admin/about", method = RequestMethod.GET)
	public String initForm(ModelMap model) throws ServiceException {
		AboutDto aboutDto = aboutService.find(1);
		if(aboutDto != null){
			model.addAttribute("about", aboutDto);
		}else{
			model.addAttribute("about", new AboutDto());
		}
		return "about";
	}
	@RequestMapping(method = RequestMethod.POST, params = "updateAbout")
	public void addAbout(@ModelAttribute("about") AboutDto aboutDto, HttpServletResponse response) throws ServiceException, IOException {
		if(aboutDto.getId() != null && aboutDto.getId() > 0){
			aboutService.update(aboutDto);
		}else{
			aboutService.add(aboutDto);
		}
		Memoizer.getInstance().remove("about");
		response.sendRedirect("/admin/about");
		/*return "redirect:/admin/about";*/
	}
}
