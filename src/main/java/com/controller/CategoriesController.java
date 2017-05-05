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
		Principal principal= request.getUserPrincipal();
		if(principal == null){
			return "login";
		}else{
			model.addAttribute("category", new CategoryDto());
			return "categories";
		}
	}

	/*@RequestMapping(method = RequestMethod.POST)
	public String processSubmit(
			@ModelAttribute("category") CategoryDto categoryDto,
			BindingResult result, SessionStatus status) {
		if (result.hasErrors()) {
			return "/admin/categories";
		} else {
			status.setComplete();
			return "/admin/categories";
		}
	}*/
	@RequestMapping(method = RequestMethod.POST, params = "addCategory")
	public String addCategory(@ModelAttribute("category") CategoryDto categoryDto) throws ServiceException {
		if(categoryDto.getId() != null && categoryDto.getId() > 0){
			categoriesService.update(categoryDto);
		}else{
			categoriesService.add(categoryDto);
		}
		return "redirect:/admin/categories";
	}

	@RequestMapping(value = "/admin/categories/edit/{id}", method = RequestMethod.GET)
	public String getEdit(@PathVariable long id, Model model, HttpServletRequest request)  throws ServiceException {
		//AuthorizedUserInfo aui = (AuthorizedUserInfo) request.getSession().getAttribute("aui");
		CategoryDto categoryDto = categoriesService.findById(id);
		model.addAttribute("category",categoryDto);
		return "categories";
	}
	@RequestMapping(value = "/admin/categories/edit/{id}", method = RequestMethod.POST)
	public String saveEdit(@ModelAttribute("category") CategoryDto categoryDto, @PathVariable long id) throws ServiceException {
		categoriesService.update(categoryDto);
		return "redirect:/admin/categories";
	}

	@RequestMapping(value = "/admin/categories/delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable long id, Model model, HttpServletRequest request)  throws ServiceException{
		categoriesService.delete(id);
		return "redirect:/admin/categories";
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
