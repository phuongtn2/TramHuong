package com.controller;

import com.controller.memoizer.Memoizer;
import com.tramhuong.dto.CategoryDto;
import com.tramhuong.dto.IntroduceDto;
import com.tramhuong.dto.MappingCategoryDto;
import com.tramhuong.services.*;
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
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

@Controller
public class IntroduceController {
	@Autowired
	private IntroduceService introduceService;
	@Autowired
	private CategoriesService categoriesService;
	@Autowired
	private BlogService blogService;
	@Autowired
	private AboutService aboutService;
	@Autowired
	private StaticService staticService;
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

	@RequestMapping(method = RequestMethod.POST, params = "addIntroduce")
	public void addIntroduce(@ModelAttribute("introduce") IntroduceDto introduceDto, HttpServletResponse response) throws ServiceException, IOException {
		if(introduceDto.getId() != null && introduceDto.getId() > 0){
			introduceService.update(introduceDto);
		}else{
			introduceService.add(introduceDto);
		}
		Memoizer.getInstance().remove("introduce");
		response.sendRedirect("/admin/introduce");
	}

	@RequestMapping(value = "/introduce", method = RequestMethod.GET)
	public String initForm(HttpServletRequest request, ModelMap model) throws ServiceException, UnsupportedEncodingException {
		List<MappingCategoryDto> mappingCategoryDtos = CommonController.loadCategory(categoriesService, Memoizer.getInstance());
		model.addAttribute("mapping_categories", mappingCategoryDtos);
		model.addAttribute("mSize", mappingCategoryDtos.size());
		CommonController.loadCommon(Memoizer.getInstance(), request, model, aboutService, blogService);
		IntroduceDto introduceDto = new IntroduceDto();
		if(Memoizer.getInstance().get("introduce") == null) {
			introduceDto = introduceService.find();
			Memoizer.getInstance().put("introduce", introduceDto);
		}else{
			introduceDto = (IntroduceDto) Memoizer.getInstance().get("introduce");
		}
		if(introduceDto != null){
			model.addAttribute("introduce", introduceDto);
		}else{
			model.addAttribute("introduce", new IntroduceDto());
		}
		model.addAttribute("active", "_2");
		return "introduce";
	}
}
