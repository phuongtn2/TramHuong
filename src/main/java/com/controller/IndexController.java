package com.controller;

import com.controller.memoizer.Memoizer;
import com.tramhuong.dto.BlogDto;
import com.tramhuong.dto.CategoryDto;
import com.tramhuong.dto.MappingCategoryDto;
import com.tramhuong.dto.ProductDto;
import com.tramhuong.services.*;
import com.tramhuong.services.error.ServiceException;
import org.cache2k.Cache;
import org.cache2k.Cache2kBuilder;
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
	public String initForm(HttpServletRequest request, ModelMap model) throws ServiceException, UnsupportedEncodingException, NoSuchFieldException, IllegalAccessException {

		List<MappingCategoryDto> mappingCategoryDtos = CommonController.loadCategory(categoriesService, Memoizer.getInstance());
		model.addAttribute("mapping_categories", mappingCategoryDtos);
		model.addAttribute("mSize", mappingCategoryDtos.size());
		CommonController.loadCommon(Memoizer.getInstance(), request, model, aboutService, blogService);
		//Product Highlight
		List<ProductDto> highs = new ArrayList<ProductDto>();
		if(Memoizer.getInstance().get("high-home") == null){
			highs = productService.findHighlights(9);
			Memoizer.getInstance().put("high-home", highs);
		}else{
			highs = (List<ProductDto>) Memoizer.getInstance().get("high-home");
		}
		model.addAttribute("pHighlights", highs);
		List<ProductDto> sales = new ArrayList<ProductDto>();
		if(Memoizer.getInstance().get("sale-home") == null){
			sales = productService.findSale(6);
			Memoizer.getInstance().put("sale-home", sales);
		}else{
			sales = (List<ProductDto>) Memoizer.getInstance().get("sale-home");
		}
		model.addAttribute("pSales", sales);
		/*model.addAttribute("pNews", productService.findNew(9));*/
		model.addAttribute("active", "_1");
		return "index";
	}
}
