
package com.controller;

import com.tramhuong.dto.*;
import com.tramhuong.services.AboutService;
import com.tramhuong.services.BlogService;
import com.tramhuong.services.CategoriesService;
import com.tramhuong.services.ProductService;
import com.tramhuong.services.error.ServiceException;
import org.springframework.ui.ModelMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

public class CommonController {
	public static void loadCommon(HttpServletRequest request, ModelMap model
	, AboutService aboutService, BlogService blogService) throws UnsupportedEncodingException, ServiceException {
		loadCart(request, model);
		loadAbout(model,aboutService);
		loadBlog(model,blogService);
	}
	public static List<MappingCategoryDto> loadCategory(CategoriesService categoriesService) throws ServiceException {
		List<CategoryDto> categoryDtos = categoriesService.findByStatus((byte) 1);
		List<MappingCategoryDto> mappingCategoryDtos = new ArrayList<MappingCategoryDto>();
		if(categoryDtos != null && categoryDtos.size() > 0){
			for (CategoryDto categoryDto: categoryDtos) {
				MappingCategoryDto mappingCategoryDto = new MappingCategoryDto();
				List<CategoryDto> subCategories = categoriesService.findByParent(categoryDto.getId());
				mappingCategoryDto.setCategoryDto(categoryDto);
				mappingCategoryDto.setSuCategories(subCategories);
				mappingCategoryDtos.add(mappingCategoryDto);
				mappingCategoryDto.setSubSize(subCategories.size());
			}
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
	public static void loadContentCart(HttpServletRequest request, ModelMap model, ProductService productService, Properties setting) throws ServiceException, UnsupportedEncodingException {
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
					if(productDto.getIsSale() == 1)
						price = productDto.getSalePrice() * cartDto.getCount();
					else
						price = productDto.getPrice() * cartDto.getCount();
					totalPrice = totalPrice + price;
				}
			Double shipping = Double.valueOf(setting.getProperty("shipping.cost"));
			DecimalFormat decimalFormat = new DecimalFormat("###,###,###");
			String sPrice = decimalFormat.format(totalPrice + shipping);

			model.addAttribute("products", productDtos);
			model.addAttribute("carts", cartListDto);
			if(cartListDto.getCartDtoList().size() > 0) {
				model.addAttribute("shipping", decimalFormat.format(shipping));
				cartListDto.setTotalPrice(sPrice);
			}else{
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
	public static void loadBlog(ModelMap model, BlogService blogService) throws ServiceException {
		List<BlogDto> blogDtos = blogService.findByStatus((byte) 1);
		if(blogDtos != null){
			List<BlogDto> blogs0 = new ArrayList<BlogDto>();
			List<BlogDto> blogs1 = new ArrayList<BlogDto>();
			for (BlogDto blogDto: blogDtos) {
				if(blogDto.getType() == 0){
					blogs0.add(blogDto);
				}else{
					blogs1.add(blogDto);
				}
			}
			model.addAttribute("blogs0", blogs0);
			/*model.addAttribute("blogs1", blogs1);*/
		}
	}

	public static void loadAbout(ModelMap model, AboutService aboutService) throws ServiceException {
		AboutDto aboutDto = aboutService.find();
		model.addAttribute("about", aboutDto);
	}
}

