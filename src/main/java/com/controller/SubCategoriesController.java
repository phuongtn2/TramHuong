package com.controller;

import com.tramhuong.dto.CategoryDto;
import com.tramhuong.services.CategoriesService;
import com.tramhuong.services.error.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class SubCategoriesController {
	@Autowired
	private CategoriesService categoriesService;
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}

	@RequestMapping(value = "/admin/s_categories", method = RequestMethod.GET)
	public String initForm(ModelMap model) throws ServiceException {
		model.addAttribute("category", new CategoryDto());
		return "s_categories";
	}

	@RequestMapping(method = RequestMethod.POST, params = "addSubCategory")
	public void addSubCategory(@ModelAttribute("category") CategoryDto categoryDto, HttpServletResponse response) throws ServiceException, IOException {
		if(categoryDto.getId() != null && categoryDto.getId() > 0){
			categoriesService.updateS(categoryDto);
		}else{
			categoriesService.addS(categoryDto);
		}
		response.sendRedirect("/admin/s_categories");
	}

	@RequestMapping(value = "/admin/s_categories/edit/{id}", method = RequestMethod.GET)
	public String getEdit(@PathVariable long id, Model model, HttpServletRequest request)  throws ServiceException {
		//AuthorizedUserInfo aui = (AuthorizedUserInfo) request.getSession().getAttribute("aui");
		CategoryDto categoryDto = categoriesService.findByIdS(id);
		model.addAttribute("category",categoryDto);
		return "s_categories";
	}
	@RequestMapping(value = "/admin/s_categories/edit/{id}", method = RequestMethod.POST)
	public void saveEdit(@ModelAttribute("category") CategoryDto categoryDto, @PathVariable long id, HttpServletResponse response) throws ServiceException, IOException {
		categoriesService.updateS(categoryDto);
		response.sendRedirect("/admin/s_categories");
	}

	@RequestMapping(value = "/admin/s_categories/delete/{id}", method = RequestMethod.GET)
	public void delete(@PathVariable long id, Model model, HttpServletRequest request, HttpServletResponse response) throws ServiceException, IOException {
		categoriesService.deleteS(id);
		response.sendRedirect("/admin/s_categories");
	}

	@ModelAttribute("categories")
	public List<CategoryDto> populateCategories() throws ServiceException {
		return categoriesService.findAll();
	}
	
	@ModelAttribute("s_categories")
	public List<CategoryDto> populateSubCategories() throws ServiceException {
		return categoriesService.findAllS();
	}

	@RequestMapping(value = "/admin/subCategory/{id}", method = RequestMethod.GET, headers = "Accept=application/json", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<CategoryDto> getSubCategories(HttpServletRequest request, @PathVariable long id) throws ServiceException {
		return categoriesService.findByParent(id);
	}
}
