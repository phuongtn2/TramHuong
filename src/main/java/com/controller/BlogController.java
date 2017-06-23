
package com.controller;

import com.controller.memoizer.Memoizer;
import com.tramhuong.dto.BlogDto;
import com.tramhuong.dto.MappingCategoryDto;
import com.tramhuong.dto.PostDto;
import com.tramhuong.dto.TagDto;
import com.tramhuong.services.AboutService;
import com.tramhuong.services.BlogService;
import com.tramhuong.services.CategoriesService;
import com.tramhuong.services.TagService;
import com.tramhuong.services.error.ServiceException;
import com.tramhuong.util.str.StringUtil;
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
	private TagService tagService;
	@Autowired
	private ServletContext servletContext;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}

	@RequestMapping(value = "/posts", method = RequestMethod.GET)
	public String initForm(HttpServletRequest request, ModelMap model) throws ServiceException, UnsupportedEncodingException {
		List<MappingCategoryDto> mappingCategoryDtos = CommonController.loadCategory(categoriesService, Memoizer.getInstance());
		model.addAttribute("mapping_categories", mappingCategoryDtos);
		model.addAttribute("mSize", mappingCategoryDtos.size());
		model.addAttribute("bre", "Bài Viết");
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
		if(Memoizer.getInstance().get("post-home") == null) {
			postDtos = blogService.findByStatus();
			Memoizer.getInstance().put("post-home", postDtos);
		}else{
			postDtos = (List<PostDto>) Memoizer.getInstance().get("post-home");
		}
		model.addAttribute("posts", postDtos);
		model.addAttribute("active", "_3");
		return "blog";
	}

	@RequestMapping(value = "/posts/{tag}", method = RequestMethod.GET)
	public String searchByTag(HttpServletRequest request, ModelMap model, @PathVariable String tag) throws ServiceException, UnsupportedEncodingException {
		List<MappingCategoryDto> mappingCategoryDtos = CommonController.loadCategory(categoriesService, Memoizer.getInstance());
		model.addAttribute("mapping_categories", mappingCategoryDtos);
		model.addAttribute("mSize", mappingCategoryDtos.size());
		model.addAttribute("bre", "Bài Viết");
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
		if(Memoizer.getInstance().get("post-" + tag) == null) {
			postDtos = blogService.findByTag(tag);
			Memoizer.getInstance().put("post-" + tag, postDtos);
		}else{
			postDtos = (List<PostDto>) Memoizer.getInstance().get("post-" + tag);
		}
		model.addAttribute("posts", postDtos);
		model.addAttribute("active", "_3");
		return "blog";
	}

	@RequestMapping(value = "/post/{id}", method = RequestMethod.GET)
	public String postContent(HttpServletRequest request, ModelMap model, @PathVariable int id) throws ServiceException, UnsupportedEncodingException {
		List<MappingCategoryDto> mappingCategoryDtos = CommonController.loadCategory(categoriesService, Memoizer.getInstance());
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
		PostDto postDto = blogService.findPostById(id);
		model.addAttribute("post", postDto);
		if(!StringUtil.isEmpty(postDto.getTag())) {
			String[] tagsP = postDto.getTag().split(",");
			List<String> strings = new ArrayList<String>();
			for (String s : tagsP) {
				strings.add(s);
			}
			model.addAttribute("tagsOfPost", strings);
		}
		return "post";
	}

	@RequestMapping(value = "/admin/posts", method = RequestMethod.GET)
	public String initForm(ModelMap model) throws ServiceException {
		List<PostDto> postDtos = blogService.findAllPost();
		if(postDtos != null){
			model.addAttribute("posts", postDtos);
		}else{
			model.addAttribute("posts", new ArrayList<BlogDto>());
		}
		return "post-admin";
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
		/*model.addAttribute("blogs",  blogService.findAll());*/
		return "post-detail";
	}

	@RequestMapping(value = "/admin/post/edit/{id}", method = RequestMethod.GET)
	public String managerEditPost(ModelMap model, @PathVariable long id) throws ServiceException {
		PostDto postDto = blogService.findPostById(id);
		model.addAttribute("post", postDto);
		List<TagDto> tagDtos = new ArrayList<TagDto>();
		if(Memoizer.getInstance().get("tagList") == null){
			tagDtos = tagService.findByStatus((byte)1);
			Memoizer.getInstance().put("tagList", tagDtos);
		}else{
			tagDtos = (List<TagDto>) Memoizer.getInstance().get("tagList");
		}
		model.addAttribute("tags", tagDtos);
		if(!StringUtil.isEmpty(postDto.getTag())) {
			String[] tagsP = postDto.getTag().split(",");
			List<String> strings = new ArrayList<String>();
			for (String s : tagsP) {
				strings.add(s);
			}
			model.addAttribute("tagsP", strings);
		}
		return "post-add";
	}

	@RequestMapping(value = "/admin/post/add", method = RequestMethod.GET)
	public String managerAddPost(ModelMap model) throws ServiceException {
		List<TagDto> tagDtos = new ArrayList<TagDto>();
		if(Memoizer.getInstance().get("tagList") == null){
			tagDtos = tagService.findByStatus((byte)1);
			Memoizer.getInstance().put("tagList", tagDtos);
		}else{
			tagDtos = (List<TagDto>) Memoizer.getInstance().get("tagList");
		}
		model.addAttribute("tags", tagDtos);
		model.addAttribute("post", new PostDto());
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

