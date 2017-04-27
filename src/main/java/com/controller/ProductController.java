
package com.controller;

import com.tramhuong.dto.CategoryDto;
import com.tramhuong.dto.IntroduceDto;
import com.tramhuong.dto.MappingCategoryDto;
import com.tramhuong.dto.ProductDto;
import com.tramhuong.services.*;
import com.tramhuong.services.error.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.FormParam;
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
	@Autowired
	private AboutService aboutService;
	@RequestMapping(value = "admin/product", method = RequestMethod.GET)
	public String initForm(ModelMap model) throws ServiceException {
		return "product";
	}

	@RequestMapping(value = "/product/{id}", method = RequestMethod.GET)
	public String initForm(HttpServletRequest request, ModelMap model, @PathVariable long id) throws ServiceException, UnsupportedEncodingException {
		List<MappingCategoryDto> mappingCategoryDtos = CommonController.loadCategory(categoriesService);
		model.addAttribute("mapping_categories", mappingCategoryDtos);
		model.addAttribute("mSize", mappingCategoryDtos.size());
		CommonController.loadCommon(request, model, aboutService, blogService);
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
		return "product-detail";
	}

	@RequestMapping(value = "/category/{id}", method = RequestMethod.GET)
	public String loadByCategory(HttpServletRequest request, ModelMap model, @PathVariable long id) throws ServiceException, UnsupportedEncodingException {
		List<MappingCategoryDto> mappingCategoryDtos = CommonController.loadCategory(categoriesService);
		model.addAttribute("mapping_categories", mappingCategoryDtos);
		model.addAttribute("mSize", mappingCategoryDtos.size());
		CommonController.loadCommon(request, model, aboutService, blogService);
		if(mappingCategoryDtos != null){
			for (MappingCategoryDto mappingCategoryDto: mappingCategoryDtos) {
				if(mappingCategoryDto != null){
					if(mappingCategoryDto.getCategoryDto().getId() == id){
						model.addAttribute("bre", mappingCategoryDto.getCategoryDto().getName());
					}
				}
			}
		}
		//Get list product by category
		List<ProductDto> productDtoList = new ArrayList<ProductDto>();
		productDtoList = productService.findByCategory(id, 0);
		model.addAttribute("productList", productDtoList);
		return "product-list";
	}
	@RequestMapping(value = "/sub-category/{id}", method = RequestMethod.GET)
	public String loadBySubCategory(HttpServletRequest request, ModelMap model, @PathVariable long id) throws ServiceException, UnsupportedEncodingException {
		List<MappingCategoryDto> mappingCategoryDtos = CommonController.loadCategory(categoriesService);
		model.addAttribute("mapping_categories", mappingCategoryDtos);
		model.addAttribute("mSize", mappingCategoryDtos.size());
		CommonController.loadCommon(request, model, aboutService, blogService);
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
		return "product-list";
	}

	@RequestMapping(value = "/product/all", method = RequestMethod.GET)
	public String loadAllProduct(HttpServletRequest request, ModelMap model) throws ServiceException, UnsupportedEncodingException {
		List<MappingCategoryDto> mappingCategoryDtos = CommonController.loadCategory(categoriesService);
		model.addAttribute("mapping_categories", mappingCategoryDtos);
		model.addAttribute("mSize", mappingCategoryDtos.size());
		CommonController.loadCommon(request, model, aboutService, blogService);
		//Get list product by category
		List<ProductDto> productDtoList = new ArrayList<ProductDto>();
		productDtoList = productService.findByStatus((byte)1);
		model.addAttribute("bre", "All");
		model.addAttribute("productList", productDtoList);
		return "product-list";
	}
	@RequestMapping(value = "/product/sales", method = RequestMethod.GET)
	public String loadAllSales(HttpServletRequest request, ModelMap model) throws ServiceException, UnsupportedEncodingException {
		List<MappingCategoryDto> mappingCategoryDtos = CommonController.loadCategory(categoriesService);
		model.addAttribute("mapping_categories", mappingCategoryDtos);
		model.addAttribute("mSize", mappingCategoryDtos.size());
		CommonController.loadCommon(request, model, aboutService, blogService);
		//Get list product by category
		List<ProductDto> productDtoList = new ArrayList<ProductDto>();
		productDtoList = productService.findSale(0);
		model.addAttribute("bre", "Sales");
		model.addAttribute("productList", productDtoList);
		return "product-list";
	}

	@RequestMapping(value = "/searchByTag/{tag}", method = RequestMethod.GET)
	public String loadSearchByTag(HttpServletRequest request, ModelMap model, @PathVariable String tag) throws ServiceException, UnsupportedEncodingException {
		List<MappingCategoryDto> mappingCategoryDtos = CommonController.loadCategory(categoriesService);
		model.addAttribute("mapping_categories", mappingCategoryDtos);
		model.addAttribute("mSize", mappingCategoryDtos.size());
		CommonController.loadCommon(request, model, aboutService, blogService);
		model.addAttribute("bre", tag);
		//Get list product by category
		List<ProductDto> productDtoList = new ArrayList<ProductDto>();
		productDtoList = productService.findByTag(tag);
		model.addAttribute("productList", productDtoList);
		return "product-list";
	}
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String loadSearchByName(HttpServletRequest request, ModelMap model, @ModelAttribute("productName") String name) throws ServiceException, UnsupportedEncodingException {
		List<MappingCategoryDto> mappingCategoryDtos = CommonController.loadCategory(categoriesService);
		model.addAttribute("mapping_categories", mappingCategoryDtos);
		model.addAttribute("mSize", mappingCategoryDtos.size());
		CommonController.loadCommon(request, model, aboutService, blogService);
		model.addAttribute("bre", name != null ? name: "tram huong");
		//Get list product by category
		List<ProductDto> productDtoList = new ArrayList<ProductDto>();
		productDtoList = productService.findByName(name != null ? name: "tram huong");
		model.addAttribute("productList", productDtoList);
		return "product-list";
	}
	@RequestMapping(value = "/product_quitView/{id}", method = RequestMethod.GET, headers = "Accept=application/json", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ProductDto getQuitViewProduct(HttpServletRequest request, @PathVariable long id) throws ServiceException {
		ProductDto productDto = productService.findById(id);
		return productDto;
	}
}

