
package com.controller;

import com.tramhuong.dto.BlogDto;
import com.tramhuong.dto.MappingCategoryDto;
import com.tramhuong.dto.PostDto;
import com.tramhuong.dto.ProductDto;
import com.tramhuong.services.AboutService;
import com.tramhuong.services.BlogService;
import com.tramhuong.services.CategoriesService;
import com.tramhuong.services.ProductService;
import com.tramhuong.services.error.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class BlogController {
	@Autowired
	private ProductService productService;
	@Autowired
	private CategoriesService categoriesService;
	@Autowired
	private BlogService blogService;
	@Autowired
	private AboutService aboutService;
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}

	@RequestMapping(value = "/blog/{id}", method = RequestMethod.GET)
	public String initForm(HttpServletRequest request, ModelMap model, @PathVariable int id) throws ServiceException, UnsupportedEncodingException {
		List<MappingCategoryDto> mappingCategoryDtos = CommonController.loadCategory(categoriesService);
		BlogDto blogDto = blogService.findById(id);
		model.addAttribute("b", blogDto);
		model.addAttribute("mapping_categories", mappingCategoryDtos);
		model.addAttribute("mSize", mappingCategoryDtos.size());
		CommonController.loadCommon(request, model, aboutService, blogService);
		List<PostDto> postNews = blogService.findPostNew();
		model.addAttribute("postNews", postNews);
		if(id == 2){
			List<PostDto> postDtos = blogService.findPostByBlogId(id);
			model.addAttribute("posts", postDtos);
			model.addAttribute("postFirst", postDtos.get(0));
			model.addAttribute("active", "_6");
			return "music";
		}else if(id == 3){
			List<PostDto> postDtos = blogService.findPostByBlogId(id);
			model.addAttribute("posts", postDtos);
			model.addAttribute("active", "_6");
			return "danhngon";
		}else{
			List<PostDto> postDtos = blogService.findPostByBlogId(id);
			model.addAttribute("posts", postDtos);
			if(id==1)
				model.addAttribute("active", "_6");
			else
				model.addAttribute("active", "_3");
			return "blog";
		}
	}

	@RequestMapping(value = "/blogs/post/{id}", method = RequestMethod.GET)
	public String postContent(HttpServletRequest request, ModelMap model, @PathVariable int id) throws ServiceException, UnsupportedEncodingException {
		List<MappingCategoryDto> mappingCategoryDtos = CommonController.loadCategory(categoriesService);
		BlogDto blogDto = blogService.findById(id);
		model.addAttribute("b", blogDto);
		model.addAttribute("mapping_categories", mappingCategoryDtos);
		model.addAttribute("mSize", mappingCategoryDtos.size());
		CommonController.loadCommon(request, model, aboutService, blogService);
		List<PostDto> postNews = blogService.findPostNew();
		model.addAttribute("postNews", postNews);
		model.addAttribute("post", blogService.findPostById(id));
		return "post";
	}

	@RequestMapping(value = "/admin/blogs", method = RequestMethod.GET)
	public String initForm(ModelMap model) throws ServiceException {
		List<BlogDto> blogDtos = blogService.findAll();
		if(blogDtos != null){
			model.addAttribute("blogs", blogDtos);
		}else{
			model.addAttribute("blogs", new ArrayList<BlogDto>());
		}
		return "blog-admin";
	}
	@RequestMapping(value = "/admin/blog/edit/{id}", method = RequestMethod.GET)
	public String redirectEdit(ModelMap model, @PathVariable int id) throws ServiceException {

		List<BlogDto> blogDtos = blogService.findAll();
		if(blogDtos != null){
			model.addAttribute("blogs", blogDtos);
		}else{
			model.addAttribute("blogs", new ArrayList<BlogDto>());
		}
		BlogDto blogDto = blogService.findById(id);
		model.addAttribute("blog", blogDto);
		return "blog-admin";
	}
	@RequestMapping(method = RequestMethod.POST, params = "addBlog")
	public String addAbout(@ModelAttribute("blog") BlogDto blogDto) throws ServiceException {
		if(blogDto.getId() != null && blogDto.getId() > 0){
			blogService.update(blogDto);
		}else{
			blogService.add(blogDto);
		}
		return "redirect:/admin/blogs";
	}
}

