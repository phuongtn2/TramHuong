
package com.controller;

import com.tramhuong.dto.*;
import com.tramhuong.services.*;
import com.tramhuong.services.error.ServiceException;
import org.apache.commons.lang.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

@Controller
public class CartController {
	@Resource
	private Properties setting;
	@Autowired
	private CategoriesService categoriesService;
	@Autowired
	private ProductService productService;
	@Autowired
	private LocationService locationService;
	@Autowired
	private BillingAccountService billingAccountService;
	@Autowired
	private AboutService aboutService;
	@Autowired
	private BlogService blogService;
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String initForm(HttpServletRequest request, ModelMap model) throws ServiceException, UnsupportedEncodingException {
		List<MappingCategoryDto> mappingCategoryDtos = CommonController.loadCategory(categoriesService);
		CommonController.loadContentCart(request, model, productService, setting);
		model.addAttribute("mapping_categories", mappingCategoryDtos);
		model.addAttribute("mSize", mappingCategoryDtos.size());
		CommonController.loadCommon(request, model, aboutService, blogService);
		return "cart";
	}

	@RequestMapping(value = "/cart/add", method = RequestMethod.POST)
	public String addProductToCart(HttpServletRequest request, @ModelAttribute("cart") CartDto cartDto) throws ServiceException, UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		CartListDto cartListDto = (CartListDto) session.getAttribute("cartList");
		if(cartListDto == null) {
			cartListDto = new CartListDto();
			List<CartDto> cartDtos = new ArrayList<CartDto>();
			cartDtos.add(cartDto);
			cartListDto.setCartDtoList(cartDtos);
		}else{
			List<CartDto> cartDtos = new ArrayList<CartDto>();
			for (CartDto cartDto1: cartListDto.getCartDtoList()) {
				if(cartDto.getProductId() == cartDto1.getProductId()){
					cartDto1.setCount(cartDto1.getCount() + cartDto.getCount());
					cartDtos.add(cartDto1);
				}else{
					cartDtos.add(cartDto);
				}
			}
			cartListDto.setCartDtoList(cartDtos);
		}
		cartListDto.setOrderCode(RandomStringUtils.randomAlphanumeric(10).toUpperCase());
		session.setAttribute("cartList", cartListDto);
		return "redirect:/cart";
	}

	@RequestMapping(method = RequestMethod.POST, params = "addToCart")
	public String addProductToCart1(HttpServletRequest request, @ModelAttribute("cart") CartDto cartDto) throws ServiceException, UnsupportedEncodingException {
		return addProductToCart(request, cartDto);
	}

	@RequestMapping(method = RequestMethod.POST, params = "update")
	public String updateProductToCart(HttpServletRequest request, @ModelAttribute("carts") CartListDto cartListDto) throws ServiceException, UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		CartListDto cartListDtoSession = (CartListDto) session.getAttribute("cartList");
		CartListDto saveToSession = new CartListDto();
		List<CartDto> dtos = new ArrayList<CartDto>();
		if(cartListDto != null && cartListDto.getCartDtoList() != null) {
			saveToSession.setDescription(cartListDto.getDescription());
			saveToSession.setOrderCode(cartListDtoSession.getOrderCode());
			for (CartDto cartDto: cartListDtoSession.getCartDtoList()) {
				for (CartDto cartDto1 : cartListDto.getCartDtoList()){
					if(cartDto.getProductId() == cartDto1.getProductId()){
						cartDto.setCount(cartDto1.getCount());
						dtos.add(cartDto);
					}
				}
			}
			saveToSession.setCartDtoList(dtos);
		}
		session.removeAttribute("cartList");
		session.setAttribute("cartList", saveToSession);
		return "redirect:/cart";
	}
	@RequestMapping(method = RequestMethod.POST, params = "checkout")
	public String checkProductToCart(HttpServletRequest request, @ModelAttribute("carts") CartListDto cartListDto) throws ServiceException, UnsupportedEncodingException {
		updateProductToCart(request, cartListDto);
		return "redirect:/checkout";
	}
	@RequestMapping(method = RequestMethod.POST, params = "buyNow")
	public String checkProductToCart(HttpServletRequest request, @ModelAttribute("cart") CartDto cartDto) throws ServiceException, UnsupportedEncodingException {
		addProductToCart(request, cartDto);
		return "redirect:/checkout";
	}
	@RequestMapping(method = RequestMethod.GET, value = "/checkout")
	public String checkout(HttpServletRequest request, ModelMap model) throws ServiceException, UnsupportedEncodingException {
		List<MappingCategoryDto> mappingCategoryDtos = CommonController.loadCategory(categoriesService);
		model.addAttribute("mapping_categories", mappingCategoryDtos);
		model.addAttribute("mSize", mappingCategoryDtos.size());
		CommonController.loadCommon(request, model, aboutService, blogService);
		model.addAttribute("provinces", locationService.findProvinces());
		List<BillingAccountDto> billingAccountDtos = billingAccountService.findAll();
		model.addAttribute("billings", billingAccountDtos);
		return "checkout";
	}

	@RequestMapping(value = "/cart/change/{id}", method = RequestMethod.GET)
	public String deleteProductFromCart(HttpServletRequest request, @PathVariable long id) throws ServiceException, UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		CartListDto cartListDto = (CartListDto) session.getAttribute("cartList");
		if(cartListDto != null) {
			CartListDto setSession = new CartListDto();
			setSession.setOrderCode(cartListDto.getOrderCode());
			setSession.setDescription(cartListDto.getDescription());
			List<CartDto> cartDtos = new ArrayList<CartDto>();
			for (CartDto cartDto : cartListDto.getCartDtoList()) {
				if(cartDto.getProductId() != id){
					cartDtos.add(cartDto);
				}
			}
			setSession.setCartDtoList(cartDtos);
			session.removeAttribute("cartList");
			session.setAttribute("cartList", setSession);
		}
		return "redirect:/cart";
	}
	@RequestMapping(value = "/location_districts/{id}", method = RequestMethod.GET, headers = "Accept=application/json", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<LocationDto> getDistrict(HttpServletRequest request, @PathVariable int id) throws ServiceException {
		return locationService.findDistricts(id);
	}
	@RequestMapping(value = "/location_wards/{id}", method = RequestMethod.GET, headers = "Accept=application/json", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<LocationDto> getWard(HttpServletRequest request, @PathVariable int id) throws ServiceException {
		return locationService.findWards(id);
	}
}

