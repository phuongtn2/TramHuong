package com.controller;

import com.controller.memoizer.Memoizer;
import com.tramhuong.dto.AboutDto;
import com.tramhuong.dto.StaticDto;
import com.tramhuong.dto.TermDto;
import com.tramhuong.services.StaticService;
import com.tramhuong.services.TermService;
import com.tramhuong.services.error.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
public class StaticController {
	@Autowired
	private StaticService staticService;
	@Autowired
	private TermService termService;
	@RequestMapping(value = "/admin/static", method = RequestMethod.GET)
	public String initStatic(ModelMap model) throws ServiceException {
		List<StaticDto> staticDtos = staticService.findAll();
		if(staticDtos != null){
			model.addAttribute("statics", staticDtos);
		}else{
			model.addAttribute("statics", new ArrayList<StaticDto>());
		}
		/*List<TermDto> termDtos = termService.findAll();
		if(termDtos != null){
			model.addAttribute("terms", termDtos);
		}else {
			model.addAttribute("terms", new ArrayList<TermDto>());
		}*/
		return "static";
	}
	@RequestMapping(value = "/admin/static/edit/{id}", method = RequestMethod.GET)
	public String redirectEdit(ModelMap model, @PathVariable int id) throws ServiceException {
		StaticDto staticDto = staticService.find(id);
		model.addAttribute("staticDto", staticDto);
		return "static-add";
	}
	@RequestMapping(method = RequestMethod.POST, params = "addStatic")
	public void addAbout(@ModelAttribute("staticDto") StaticDto staticDto, HttpServletResponse response) throws ServiceException, IOException {
		if(staticDto.getId() != null && staticDto.getId() > 0){
			staticService.update(staticDto);
		}else{
			staticService.add(staticDto);
		}
		Memoizer.getInstance().remove("buyHome");
		Memoizer.getInstance().remove("shippingHome");
		Memoizer.getInstance().remove("paymentHome");
		response.sendRedirect("/admin/static");
	}
	@RequestMapping(value = "/admin/rule/edit/{type}", method = RequestMethod.GET)
	public String initRule(ModelMap model, @PathVariable int type) throws ServiceException {
		TermDto termDto = termService.findByType(type);
		if(termDto != null){
			model.addAttribute("rule", termDto);
		}else{
			model.addAttribute("rule", new TermDto());
		}
		return "rule";
	}
	@RequestMapping(value = "/admin/add-rule", method = RequestMethod.POST)
	public void addRule(@ModelAttribute("rule") TermDto termDto, HttpServletResponse response) throws ServiceException, IOException {
		if(termDto.getId() != null && termDto.getId() > 0){
			termService.update(termDto);
		}else{
			termService.add(termDto);
		}
		response.sendRedirect("/admin/static");
	}
}
