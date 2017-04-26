package com.controller;

import com.tramhuong.dto.AuthorizedUserInfo;
import com.tramhuong.dto.CategoryDto;
import com.tramhuong.services.AuthorizedUserTokenService;
import com.tramhuong.services.CategoriesService;
import com.tramhuong.services.error.ServiceException;
import com.tramhuong.util.str.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class CategoriesController {
	@Autowired
	private CategoriesService categoriesService;

	@RequestMapping(value = "/admin/categories", method = RequestMethod.GET)
	public String initForm(ModelMap model) throws ServiceException {
		model.addAttribute("category", new CategoryDto());
		return "categories";
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
