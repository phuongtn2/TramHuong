
package com.controller;

import com.tramhuong.dto.*;
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
					Double price = productDto.getPrice() * cartDto.getCount();
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
}

