

package com.controller;

import com.tramhuong.dto.BlogDto;
import com.tramhuong.dto.TagDto;
import com.tramhuong.services.TagService;
import com.tramhuong.services.error.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class TagController {
	@Autowired
	private TagService tagService;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}

	@RequestMapping(value = "/admin/tags", method = RequestMethod.GET)
	public String initForm(ModelMap model) throws ServiceException {
		List<TagDto> tagDtos = tagService.findAll();
		if(tagDtos != null){
			model.addAttribute("tags", tagDtos);
		}else{
			model.addAttribute("tags", new ArrayList<BlogDto>());
		}
		return "tags";
	}
	@RequestMapping(value = "/admin/tag", method = RequestMethod.GET)
	public String redirectAdd(ModelMap model) throws ServiceException {
		model.addAttribute("tag", new TagDto());
		return "tag-add";
	}
	@RequestMapping(value = "/admin/tag/edit/{id}", method = RequestMethod.GET)
	public String redirectEdit(ModelMap model, @PathVariable int id) throws ServiceException {
		TagDto tagDto = tagService.findById(id);
		model.addAttribute("tag", tagDto);
		return "tag-add";
	}
	@RequestMapping(method = RequestMethod.POST, params = "addTag")
	public void addAbout(@ModelAttribute("tag") TagDto tagDto, HttpServletResponse response) throws ServiceException, IOException {
		if(tagDto.getId() != null && tagDto.getId() > 0){
			tagService.update(tagDto);
		}else{
			tagService.add(tagDto);
		}
		response.sendRedirect("/admin/tags");
	}
}

