
package com.controller;

import com.controller.memoizer.Memoizer;
import com.tramhuong.dto.BlogDto;
import com.tramhuong.dto.MappingCategoryDto;
import com.tramhuong.dto.PostDto;
import com.tramhuong.services.AboutService;
import com.tramhuong.services.BlogService;
import com.tramhuong.services.CategoriesService;
import com.tramhuong.services.error.ServiceException;
import org.apache.commons.lang.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class BlogController {
	@Autowired
	private CategoriesService categoriesService;
	@Autowired
	private BlogService blogService;
	@Autowired
	private AboutService aboutService;
	@Autowired
	private ServletContext servletContext;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}

	@RequestMapping(value = "/blog/{id}", method = RequestMethod.GET)
	public String initForm(HttpServletRequest request, ModelMap model, @PathVariable int id) throws ServiceException, UnsupportedEncodingException {
		List<MappingCategoryDto> mappingCategoryDtos = CommonController.loadCategory(categoriesService, Memoizer.getInstance());
		BlogDto blogDto = new BlogDto();
		if(Memoizer.getInstance().get("blog" + id) == null) {
			blogDto = blogService.findById(id);
			Memoizer.getInstance().put("blog" + id, blogDto);
		}else{
			blogDto = (BlogDto) Memoizer.getInstance().get("blog" + id);
		}
		model.addAttribute("b", blogDto);
		model.addAttribute("mapping_categories", mappingCategoryDtos);
		model.addAttribute("mSize", mappingCategoryDtos.size());
		CommonController.loadCommon(Memoizer.getInstance(), request, model, aboutService, blogService);
		List<PostDto> postNews = new ArrayList<PostDto>();
		if(Memoizer.getInstance().get("post") == null) {
			postNews = blogService.findPostNew();
			Memoizer.getInstance().put("post", postNews);
		}else{
			postNews = (List<PostDto>) Memoizer.getInstance().get("post");
		}
		model.addAttribute("postNews", postNews);
		List<PostDto> postDtos = new ArrayList<PostDto>();
		if(Memoizer.getInstance().get("post-home" + id) == null) {
			postDtos = blogService.findPostByBlogId(id, (byte) 1);
			Memoizer.getInstance().put("post-home" + id, postDtos);
		}else{
			postDtos = (List<PostDto>) Memoizer.getInstance().get("post-home" + id);
		}
			model.addAttribute("posts", postDtos);
			/*if(id==1)
				model.addAttribute("active", "_6");
			else*/
			/*model.addAttribute("active", "_3");*/
			return "blog";
		//}
	}

	@RequestMapping(value = "/blogs/post/{id}", method = RequestMethod.GET)
	public String postContent(HttpServletRequest request, ModelMap model, @PathVariable int id) throws ServiceException, UnsupportedEncodingException {
		List<MappingCategoryDto> mappingCategoryDtos = CommonController.loadCategory(categoriesService, Memoizer.getInstance());
		/*BlogDto blogDto = new BlogDto();
		if(Memoizer.getInstance().get("blog" + id) == null) {
			blogDto = blogService.findById(id);
			Memoizer.getInstance().put("blog" + id, blogDto);
		}else{
			blogDto = (BlogDto) Memoizer.getInstance().get("blog" + id);
		}
		model.addAttribute("b", blogDto);*/
		model.addAttribute("mapping_categories", mappingCategoryDtos);
		model.addAttribute("mSize", mappingCategoryDtos.size());
		CommonController.loadCommon(Memoizer.getInstance(), request, model, aboutService, blogService);
		List<PostDto> postNews = new ArrayList<PostDto>();
		if(Memoizer.getInstance().get("post") == null) {
			postNews = blogService.findPostNew();
			Memoizer.getInstance().put("post", postNews);
		}else{
			postNews = (List<PostDto>) Memoizer.getInstance().get("post");
		}
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
	@RequestMapping(value = "/admin/blog", method = RequestMethod.GET)
	public String redirectAdd(ModelMap model) throws ServiceException {
		model.addAttribute("blog", new BlogDto());
		return "blog-add";
	}
	@RequestMapping(value = "/admin/blog/edit/{id}", method = RequestMethod.GET)
	public String redirectEdit(ModelMap model, @PathVariable int id) throws ServiceException {
		BlogDto blogDto = blogService.findById(id);
		model.addAttribute("blog", blogDto);
		return "blog-add";
	}
	@RequestMapping(method = RequestMethod.POST, params = "addBlog")
	public void addAbout(@ModelAttribute("blog") BlogDto blogDto, HttpServletResponse response) throws ServiceException, IOException {
		if(blogDto.getId() != null && blogDto.getId() > 0){
			blogService.update(blogDto);
		}else{
			blogService.add(blogDto);
		}
		Memoizer.getInstance().removeAll();
		response.sendRedirect("/admin/blogs");
	}

	@RequestMapping(value = "/admin/blog/view/{id}", method = RequestMethod.GET)
	public String viewPostByBlogId(ModelMap model, @PathVariable int id) throws ServiceException {

		List<PostDto> postDtos = blogService.findPostByBlogId(id, (byte)-1);
		if(postDtos != null){
			model.addAttribute("posts", postDtos);
		}else{
			model.addAttribute("posts", new ArrayList<PostDto>());
		}
		List<BlogDto> blogDtos = blogService.findAll();
		if(blogDtos != null){
			model.addAttribute("blogs", blogDtos);
		}else{
			model.addAttribute("blogs", new ArrayList<BlogDto>());
		}
		model.addAttribute("blogId", id);
		return "post-admin";
	}

	@RequestMapping(value = "/admin/post/view/{id}", method = RequestMethod.GET)
	public String managerViewPost(ModelMap model, @PathVariable long id) throws ServiceException {
		model.addAttribute("post", blogService.findPostById(id));
		model.addAttribute("blogs",  blogService.findAll());
		return "post-detail";
	}

	@RequestMapping(value = "/admin/post/edit/{id}", method = RequestMethod.GET)
	public String managerEditPost(ModelMap model, @PathVariable long id) throws ServiceException {
		model.addAttribute("post", blogService.findPostById(id));
		model.addAttribute("blogs",  blogService.findAll());
		return "post-add";
	}

	@RequestMapping(value = "/admin/post/add/{id}", method = RequestMethod.GET)
	public String managerAddPost(ModelMap model, @PathVariable long id) throws ServiceException {
		model.addAttribute("blogId",id);
		return "post-add";
	}

	@RequestMapping(value = "/admin/post/save", method = RequestMethod.POST)
	public void managerSavePost(HttpServletResponse response, ModelMap model, @ModelAttribute("post") PostDto postDto) throws ServiceException, IOException {
		String path = servletContext.getRealPath("/");
		if(postDto.getFile() != null && !postDto.getFile().isEmpty()){
			String fileName = "/resources/img/blogs/" + RandomStringUtils.randomAlphanumeric(10)+ "_" + postDto.getFile().getOriginalFilename();
			postDto.setImg(fileName);
			OutputStream outputStream = new FileOutputStream(path + fileName);
			int bufferSize = 256;
			BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(outputStream, bufferSize);
			bufferedOutputStream.write(postDto.getFile().getBytes());
			bufferedOutputStream.flush();
			bufferedOutputStream.close();
			outputStream.close();
		}else{
			postDto.setImg(null);
		}
		if(postDto.getId() != null && postDto.getId() > 0)
			blogService.updatePost(postDto);
		else {
			blogService.addPost(postDto);
		}
		Memoizer.getInstance().removeAll();
		response.sendRedirect("/admin/post/view/" + postDto.getId());
	}
}

