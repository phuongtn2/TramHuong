package com.controller;

import com.tramhuong.dto.CategoryDto;
import com.tramhuong.dto.IntroduceDto;
import com.tramhuong.dto.MappingCategoryDto;
import com.tramhuong.services.CategoriesService;
import com.tramhuong.services.IntroduceService;
import com.tramhuong.services.error.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.List;

@Controller
public class IntroduceController {
	@Autowired
	private IntroduceService introduceService;
	@Autowired
	private CategoriesService categoriesService;

	@RequestMapping(value = "/admin/introduce", method = RequestMethod.GET)
	public String initForm(ModelMap model) throws ServiceException {
		IntroduceDto introduceDto = introduceService.find();
		if(introduceDto != null){
			model.addAttribute("introduce", introduceDto);
		}else{
			model.addAttribute("introduce", new IntroduceDto());
		}
		return "introduceAdmin";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String processSubmit(
			@ModelAttribute("introduce") IntroduceDto introduceDto,
			BindingResult result, SessionStatus status) {
		if (result.hasErrors()) {
			return "/admin/introduce";
		} else {
			status.setComplete();
			return "/admin/introduce";
		}
	}
	@RequestMapping(method = RequestMethod.POST, params = "add")
	public String addAsset(@ModelAttribute("introduce") IntroduceDto introduceDto) throws ServiceException {
		if(introduceDto.getId() != null && introduceDto.getId() > 0){
			introduceService.update(introduceDto);
		}else{
			introduceService.add(introduceDto);
		}
		return "redirect:/admin/introduce";
	}

	@RequestMapping(value = "/introduce", method = RequestMethod.GET)
	public String initForm(HttpServletRequest request, ModelMap model) throws ServiceException, UnsupportedEncodingException {
		List<MappingCategoryDto> mappingCategoryDtos = CommonController.loadCategory(categoriesService);;
		model.addAttribute("mapping_categories", mappingCategoryDtos);
		model.addAttribute("mSize", mappingCategoryDtos.size());
		IntroduceDto introduceDto = introduceService.find();
		if(introduceDto != null){
			model.addAttribute("introduce", introduceDto);
		}else{
			model.addAttribute("introduce", new IntroduceDto());
		}
		CommonController.loadCart(request, model);
		return "introduce";
	}
}
