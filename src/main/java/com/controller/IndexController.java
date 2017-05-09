package com.controller;

import com.tramhuong.dto.BlogDto;
import com.tramhuong.dto.CategoryDto;
import com.tramhuong.dto.MappingCategoryDto;
import com.tramhuong.services.AboutService;
import com.tramhuong.services.BlogService;
import com.tramhuong.services.CategoriesService;
import com.tramhuong.services.ProductService;
import com.tramhuong.services.error.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

@Controller
public class IndexController {
	@Autowired
	private CategoriesService categoriesService;
	@Autowired
	private ProductService productService;
	@Autowired
	private BlogService blogService;
	@Autowired
	private AboutService aboutService;

	@RequestMapping(value = "/", method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
	public String initForm(HttpServletRequest request, ModelMap model) throws ServiceException, UnsupportedEncodingException {
		List<MappingCategoryDto> mappingCategoryDtos = CommonController.loadCategory(categoriesService);
		model.addAttribute("mapping_categories", mappingCategoryDtos);
		model.addAttribute("mSize", mappingCategoryDtos.size());
		CommonController.loadCommon(request, model, aboutService, blogService);
		//Product Highlight
		model.addAttribute("pHighlights", productService.findHighlights(6));
		model.addAttribute("pSales", productService.findSale(6));
		model.addAttribute("pNews", productService.findNew(9));
		model.addAttribute("active", "_1");
		return "index";
	}
}
