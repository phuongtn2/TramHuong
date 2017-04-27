
package com.controller;

import com.tramhuong.dto.CategoryDto;
import com.tramhuong.dto.IntroduceDto;
import com.tramhuong.dto.MappingCategoryDto;
import com.tramhuong.dto.ProductDto;
import com.tramhuong.services.BlogService;
import com.tramhuong.services.CategoriesService;
import com.tramhuong.services.IntroduceService;
import com.tramhuong.services.ProductService;
import com.tramhuong.services.error.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

@Controller
public class ProductController {
	@Autowired
	private BlogService blogService;
	@Autowired
	private CategoriesService categoriesService;
	@Autowired
	private ProductService productService;

	@RequestMapping(value = "admin/product", method = RequestMethod.GET)
	public String initForm(ModelMap model) throws ServiceException {
		return "product";
	}

	@RequestMapping(value = "/product/{id}", method = RequestMethod.GET)
	public String initForm(HttpServletRequest request, ModelMap model, @PathVariable long id) throws ServiceException, UnsupportedEncodingException {
		List<MappingCategoryDto> mappingCategoryDtos = CommonController.loadCategory(categoriesService);
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
		model.addAttribute("mapping_categories", mappingCategoryDtos);
		model.addAttribute("mSize", mappingCategoryDtos.size());
		CommonController.loadCart(request,model);
		CommonController.loadBlog(model, blogService);
		return "product-detail";
	}

	@RequestMapping(value = "/category/{id}", method = RequestMethod.GET)
	public String loadByCategory(HttpServletRequest request, ModelMap model, @PathVariable long id) throws ServiceException, UnsupportedEncodingException {
		List<MappingCategoryDto> mappingCategoryDtos = CommonController.loadCategory(categoriesService);
		if(mappingCategoryDtos != null){
			for (MappingCategoryDto mappingCategoryDto: mappingCategoryDtos) {
				if(mappingCategoryDto != null){
					if(mappingCategoryDto.getCategoryDto().getId() == id){
						model.addAttribute("bre", mappingCategoryDto.getCategoryDto().getName());
					}
				}
			}
		}
		CommonController.loadCart(request, model);
		//Get list product by category
		List<ProductDto> productDtoList = new ArrayList<ProductDto>();
		productDtoList = productService.findByCategory(id, 0);
		model.addAttribute("productList", productDtoList);
		model.addAttribute("mapping_categories", mappingCategoryDtos);
		model.addAttribute("mSize", mappingCategoryDtos.size());
		CommonController.loadCart(request,model);
		CommonController.loadBlog(model, blogService);
		return "product-list";
	}
	@RequestMapping(value = "/sub-category/{id}", method = RequestMethod.GET)
	public String loadBySubCategory(HttpServletRequest request, ModelMap model, @PathVariable long id) throws ServiceException, UnsupportedEncodingException {
		List<MappingCategoryDto> mappingCategoryDtos = CommonController.loadCategory(categoriesService);
		CommonController.loadCart(request, model);
		//Get list product by category
		List<ProductDto> productDtoList = new ArrayList<ProductDto>();
		productDtoList = productService.findBySubCategory(id, 0);
		if(mappingCategoryDtos != null){
			for (MappingCategoryDto mappingCategoryDto: mappingCategoryDtos) {
				if(mappingCategoryDto != null){
					for (CategoryDto categoryDto: mappingCategoryDto.getSuCategories()){
						if(categoryDto.getId() == id){
							model.addAttribute("bre", categoryDto.getName());
						}
					}
				}
			}
		}
		model.addAttribute("productList", productDtoList);
		model.addAttribute("mapping_categories", mappingCategoryDtos);
		model.addAttribute("mSize", mappingCategoryDtos.size());
		CommonController.loadCart(request,model);
		CommonController.loadBlog(model, blogService);
		return "product-list";
	}

	@RequestMapping(value = "/product_quitView/{id}", method = RequestMethod.GET, headers = "Accept=application/json", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ProductDto getQuitViewProduct(HttpServletRequest request, @PathVariable long id) throws ServiceException {
		ProductDto productDto = productService.findById(id);
		return productDto;
	}
}

