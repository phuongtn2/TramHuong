
package com.controller;

import com.tramhuong.dto.ProductDto;
import com.tramhuong.services.CategoriesService;
import com.tramhuong.services.ProductService;
import com.tramhuong.services.error.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

@Controller
public class BlogController {
	@Autowired
	private ProductService productService;
	@Autowired
	private CategoriesService categoriesService;
	@RequestMapping(value = "/blog/{id}", method = RequestMethod.GET)
	public String initForm(HttpServletRequest request, ModelMap model, @PathVariable long id) throws ServiceException, UnsupportedEncodingException {
		CommonController.loadCategory(categoriesService);
		CommonController.loadCart(request, model);
		ProductDto productDto = productService.findById(id);
		model.addAttribute("product", productDto);
		//Get product relation
		List<ProductDto> productDtoList = new ArrayList<ProductDto>();
		if(productDto.getSubCategoryId() > 0){
			productDtoList = productService.findBySubCategory(productDto.getSubCategoryId(), 6);
		}else {
			productDtoList = productService.findByCategory(productDto.getCateGoryId(), 6);
		}
		model.addAttribute("relations", productDtoList);
		CommonController.loadCategory(categoriesService);
		CommonController.loadCart(request,model);
		return "product-detail";
	}
}

