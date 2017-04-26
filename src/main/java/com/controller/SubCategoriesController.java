package com.controller;

import com.tramhuong.dto.CategoryDto;
import com.tramhuong.services.CategoriesService;
import com.tramhuong.services.error.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
public class SubCategoriesController {
	@Autowired
	private CategoriesService categoriesService;

	@RequestMapping(value = "/admin/s_categories", method = RequestMethod.GET)
	public String initForm(ModelMap model) throws ServiceException {
		model.addAttribute("category", new CategoryDto());
		return "s_categories";
	}

	@ModelAttribute("categories")
	public List<CategoryDto> populateCategories() throws ServiceException {
		return categoriesService.findAll();
	}
	
	@ModelAttribute("s_categories")
	public List<CategoryDto> populateSubCategories() throws ServiceException {
		return categoriesService.findAllS();
	}
}
