package com.controller;

import com.tramhuong.dto.AuthorizedUserInfo;
import com.tramhuong.dto.CategoryDto;
import com.tramhuong.services.AuthorizedUserTokenService;
import com.tramhuong.services.CategoriesService;
import com.tramhuong.services.error.ServiceException;
import com.tramhuong.util.str.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class CategoriesController {
	@Autowired
	private CategoriesService categoriesService;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
	@RequestMapping(value = "/admin/categories", method = RequestMethod.GET)
	public String initForm(HttpServletRequest request, ModelMap model) throws ServiceException {
			model.addAttribute("category", new CategoryDto());
			return "categories";
	}

	@RequestMapping(method = RequestMethod.POST, params = "addCategory")
	public void addCategory(@ModelAttribute("category") CategoryDto categoryDto, HttpServletResponse response) throws ServiceException, IOException {
		if(categoryDto.getId() != null && categoryDto.getId() > 0){
			categoriesService.update(categoryDto);
		}else{
			categoriesService.add(categoryDto);
		}
		response.sendRedirect("/admin/categories");
	}

	@RequestMapping(value = "/admin/category", method = RequestMethod.GET)
	public String getAdd(Model model)  throws ServiceException {
		model.addAttribute("category",new CategoryDto());
		return "category-add";
	}
	@RequestMapping(value = "/admin/categories/edit/{id}", method = RequestMethod.GET)
	public String getEdit(@PathVariable long id, Model model)  throws ServiceException {
		CategoryDto categoryDto = categoriesService.findById(id);
		model.addAttribute("category",categoryDto);
		return "category-add";
	}
	@RequestMapping(value = "/admin/categories/edit/{id}", method = RequestMethod.POST)
	public void saveEdit(@ModelAttribute("category") CategoryDto categoryDto, @PathVariable long id, HttpServletResponse response) throws ServiceException, IOException {
		categoriesService.update(categoryDto);
		response.sendRedirect("/admin/categories");
	}

	@RequestMapping(value = "/admin/categories/delete/{id}", method = RequestMethod.GET)
	public void delete(@PathVariable long id, Model model, HttpServletRequest request, HttpServletResponse response) throws ServiceException, IOException {
		categoriesService.delete(id);
		response.sendRedirect("/admin/categories");
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
