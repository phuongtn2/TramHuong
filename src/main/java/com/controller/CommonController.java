
package com.controller;

import com.tramhuong.dto.*;
import com.tramhuong.services.AboutService;
import com.tramhuong.services.BlogService;
import com.tramhuong.services.CategoriesService;
import com.tramhuong.services.ProductService;
import com.tramhuong.services.error.ServiceException;
import org.cache2k.Cache;
import org.springframework.ui.ModelMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

public class CommonController {
	public static void loadCommon(Cache cache ,HttpServletRequest request, ModelMap model
	, AboutService aboutService, BlogService blogService) throws UnsupportedEncodingException, ServiceException {
		loadCart(request, model);
		loadAbout(model,aboutService, cache);
		loadBlog(model,blogService, cache);
	}
	public static List<MappingCategoryDto> loadCategory(CategoriesService categoriesService, Cache cache) throws ServiceException {
		List<CategoryDto> categoryDtos = new ArrayList<CategoryDto>();
		if(cache.get("categories") == null) {
			categoryDtos = categoriesService.findByStatus((byte) 1);
			cache.put("categories", categoryDtos);
		}else{
			categoryDtos = (List<CategoryDto>) cache.get("categories");
		}

		List<MappingCategoryDto> mappingCategoryDtos = new ArrayList<MappingCategoryDto>();
		if(cache.get("subCategories") == null) {
			if (categoryDtos != null && categoryDtos.size() > 0) {
				for (CategoryDto categoryDto : categoryDtos) {
					MappingCategoryDto mappingCategoryDto = new MappingCategoryDto();
					List<CategoryDto> subCategories = categoriesService.findByParent(categoryDto.getId());
					mappingCategoryDto.setCategoryDto(categoryDto);
					mappingCategoryDto.setSuCategories(subCategories);
					mappingCategoryDto.setSubSize(subCategories.size());
					mappingCategoryDtos.add(mappingCategoryDto);
				}
				cache.put("subCategories", mappingCategoryDtos);
			}
		}else{
			mappingCategoryDtos = (List<MappingCategoryDto>) cache.get("subCategories");
		}
		return  mappingCategoryDtos;
	}

	public static void loadCart(HttpServletRequest request, ModelMap model) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		CartListDto cartListDto = (CartListDto) session.getAttribute("cartList");
		if(cartListDto == null){
			model.addAttribute("items", 0);
		}else {
			int items = 0;
			if(cartListDto.getCartDtoList() != null) {
				for (CartDto cartDto : cartListDto.getCartDtoList()) {
					items = items + cartDto.getCount();
				}
				model.addAttribute("items", items);
			}else{
				model.addAttribute("items", 0);
			}
		}
	}
	public static void loadContentCart(HttpServletRequest request, ModelMap model, ProductService productService, ShippingDto shippingDto) throws ServiceException, UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		CartListDto cartListDto = (CartListDto) session.getAttribute("cartList");
		if(cartListDto != null) {
			List<ProductDto> productDtos = new ArrayList<ProductDto>();
			Double totalPrice = 0.0;
			if(cartListDto.getCartDtoList() != null)
				for (CartDto cartDto : cartListDto.getCartDtoList()) {
					ProductDto productDto = productService.findById(cartDto.getProductId());
					productDtos.add(productDto);
					Double price = 0.0;
					if(productDto.getSalePrice() != null) {
						if (productDto.getIsSale() == 1 && productDto.getSalePrice() > 0)
							price = productDto.getSalePrice() * cartDto.getCount();
						else
							price = productDto.getPrice() * cartDto.getCount();
					}else{
						price = productDto.getPrice() * cartDto.getCount();
					}
					totalPrice = totalPrice + price;
				}
			DecimalFormat decimalFormat = new DecimalFormat("###,###,###");
			String sPrice = decimalFormat.format(totalPrice + shippingDto.getShippingCost());

			model.addAttribute("products", productDtos);
			model.addAttribute("carts", cartListDto);
			if(cartListDto.getCartDtoList().size() > 0) {
				model.addAttribute("productNumber", cartListDto.getCartDtoList().size());
				model.addAttribute("shipping", decimalFormat.format(shippingDto.getShippingCost()));
				cartListDto.setTotalPrice(sPrice);
			}else{
				model.addAttribute("productNumber", 0);
				cartListDto.setTotalPrice("0");
			}
		}
	}
	public static  List<ProductDto> getProductFromCart(HttpServletRequest request, ProductService productService) throws UnsupportedEncodingException, ServiceException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		CartListDto cartListDto = (CartListDto) session.getAttribute("cartList");
		List<ProductDto> productDtos = new ArrayList<ProductDto>();
		if(cartListDto != null) {
			Double totalPrice = 0.0;
			if (cartListDto.getCartDtoList() != null){
				for (CartDto cartDto : cartListDto.getCartDtoList()) {
					ProductDto productDto = productService.findById(cartDto.getProductId());
					productDto.setCount(cartDto.getCount());
					productDtos.add(productDto);
				}
			}
		}
		return productDtos;
	}
	public static void loadBlog(ModelMap model, BlogService blogService, Cache cache) throws ServiceException {
		List<BlogDto> blogDtos = new ArrayList<BlogDto>();
		if(cache.get("blogs") == null){
			blogDtos = blogService.findByStatus((byte) 1);
			cache.put("blogs", blogDtos);
		}else{
			blogDtos = (List<BlogDto>) cache.get("blogs");
		}
		if(blogDtos != null){
			model.addAttribute("blogs0", blogDtos);
		}
	}

	public static void loadAbout(ModelMap model, AboutService aboutService, Cache cache) throws ServiceException {
		AboutDto aboutDto = new AboutDto();
		if(cache.get("about") == null){
			aboutDto = aboutService.find(1);
			cache.put("about", aboutDto);
		}else{
			aboutDto = (AboutDto) cache.get("about");
		}
		model.addAttribute("about", aboutDto);
	}
}

