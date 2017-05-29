
package com.controller;

import com.controller.memoizer.Memoizer;
import com.tramhuong.dto.*;
import com.tramhuong.services.*;
import com.tramhuong.services.error.ServiceException;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.RandomStringUtils;
import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.DecimalFormat;
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
	@Autowired
	private CommonService commonService;
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String initForm(HttpServletRequest request, ModelMap model) throws ServiceException, UnsupportedEncodingException {
		List<MappingCategoryDto> mappingCategoryDtos = CommonController.loadCategory(categoriesService, Memoizer.getInstance());
		CommonController.loadContentCart(request, model, productService, new ShippingDto());
		model.addAttribute("mapping_categories", mappingCategoryDtos);
		model.addAttribute("mSize", mappingCategoryDtos.size());
		CommonController.loadCommon(Memoizer.getInstance(), request, model, aboutService, blogService);
		return "cart";
	}

	public void commonAddCart(HttpServletRequest request, CartDto cartDto) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		CartListDto cartListDto = (CartListDto) session.getAttribute("cartList");
		if(cartListDto == null) {
			cartListDto = new CartListDto();
			List<CartDto> cartDtos = new ArrayList<CartDto>();
			cartDtos.add(cartDto);
			cartListDto.setCartDtoList(cartDtos);
		}else{
			if(cartListDto.getCartDtoList().size() <= 0){
				cartListDto.getCartDtoList().add(cartDto);
			}else{
				List<CartDto> cartDtos = new ArrayList<CartDto>();
				boolean flg = false;
				for (CartDto cartDto1: cartListDto.getCartDtoList()) {
					if(cartDto.getProductId() == cartDto1.getProductId()){
						flg = true;
						break;
					}
				}
				if(flg){
					for (CartDto cartDto1: cartListDto.getCartDtoList()) {
						if(cartDto.getProductId() == cartDto1.getProductId()){
							cartDto1.setCount(cartDto1.getCount() + cartDto.getCount());
						}
						cartDtos.add(cartDto1);
					}
				}else{
					cartDtos.addAll(cartListDto.getCartDtoList());
					cartDtos.add(cartDto);
				}
				cartListDto.setCartDtoList(cartDtos);
			}
		}
		cartListDto.setOrderCode(RandomStringUtils.randomAlphanumeric(10).toUpperCase());
		session.setAttribute("cartList", cartListDto);
	}
	@RequestMapping(value = "/cart/add", method = RequestMethod.POST, headers = "Accept=application/json", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Integer addProductToCart(HttpServletRequest request, HttpServletResponse response, CartDto cartDto) throws ServiceException, IOException, JSONException {
		CartDto cartDtoTemp = new CartDto();
		if(cartDto != null && cartDto.getProductId() != null){
			cartDtoTemp = cartDto;
		}else {

			String inputJson = IOUtils.toString(request.getReader());
			JSONObject jsonObj = new JSONObject(inputJson);
			cartDtoTemp.setCount(Integer.parseInt(jsonObj.getString("count")));
			cartDtoTemp.setProductId(Long.parseLong(jsonObj.getString("productId")));
		}
		commonAddCart(request, cartDtoTemp);
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		CartListDto cartListDto = (CartListDto) session.getAttribute("cartList");
		int count = 0;
		for (CartDto dto: cartListDto.getCartDtoList()){
			count = count + dto.getCount();
		}
		return count;
		/*response.sendRedirect(request.getRequestURI());*/
	}

	/*@RequestMapping(method = RequestMethod.POST, params = "addToCart", headers = "Accept=application/json", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Integer addProductToCart1(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("cart") CartDto cartDto) throws ServiceException, IOException, JSONException {
		return addProductToCart(request,response, cartDto);
	}*/

	public void commonUpdateCart(HttpServletRequest request, CartListDto cartListDto) throws UnsupportedEncodingException {
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
	}
	@RequestMapping(method = RequestMethod.POST, params = "update")
	public void updateProductToCart(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("carts") CartListDto cartListDto) throws ServiceException, IOException {
		commonUpdateCart(request, cartListDto);
		response.sendRedirect("/cart");
	}
	@RequestMapping(method = RequestMethod.POST, params = "checkout")
	public void checkProductToCart(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("carts") CartListDto cartListDto) throws ServiceException, IOException {
		//updateProductToCart(request,response, cartListDto);
		commonUpdateCart(request, cartListDto);
		response.sendRedirect("/checkout");
	}
	@RequestMapping(method = RequestMethod.POST, params = "buyNow")
	public void checkProductToCart(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("cart") CartDto cartDto) throws ServiceException, IOException {
		commonAddCart(request, cartDto);
		response.sendRedirect("/cart");
	}
	@RequestMapping(method = RequestMethod.GET, value = "/checkout")
	public String checkout(HttpServletRequest request, ModelMap model) throws ServiceException, UnsupportedEncodingException {
		List<MappingCategoryDto> mappingCategoryDtos = CommonController.loadCategory(categoriesService, Memoizer.getInstance());
		model.addAttribute("mapping_categories", mappingCategoryDtos);
		model.addAttribute("mSize", mappingCategoryDtos.size());
		CommonController.loadCommon(Memoizer.getInstance(), request, model, aboutService, blogService);
		List<ShippingDto> shippingDto = commonService.findAllShipping();
		CommonController.loadContentCart(request, model, productService, shippingDto.get(0));
		model.addAttribute("provinces", locationService.findProvinces());
		//List<BillingAccountDto> billingAccountDtos = billingAccountService.findAll();
		List<PaymentDto> paymentDtos = commonService.findByStatusPayment();
		model.addAttribute("payments", paymentDtos);
		model.addAttribute("shippings", shippingDto);
		return "checkout";
	}

	@RequestMapping(value = "/cart/change/{id}", method = RequestMethod.GET)
	public void deleteProductFromCart(HttpServletRequest request, HttpServletResponse response, @PathVariable long id) throws ServiceException, IOException {
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
		response.sendRedirect("/cart");
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


	@RequestMapping(value = "/setTotalPrice", method = RequestMethod.POST, headers = "Accept=application/json", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<String> setTotalPrice(HttpServletRequest request, HttpServletResponse response) throws ServiceException, IOException, JSONException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String inputJson = IOUtils.toString(request.getReader());
		JSONObject jsonObj = new JSONObject(inputJson);
		Double shipping = Double.parseDouble(jsonObj.getString("cost"));
		CartListDto cartListDto = (CartListDto) session.getAttribute("cartList");
		List<String> strings = new ArrayList<String>(1);
		if(cartListDto != null && cartListDto.getCartDtoList() != null){
			Double totalPrice = 0.0;
			if(cartListDto.getCartDtoList() != null)
				for (CartDto cartDto : cartListDto.getCartDtoList()) {
					ProductDto productDto = productService.findById(cartDto.getProductId());
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
			String sPrice = decimalFormat.format(totalPrice + shipping);
			strings.add(sPrice);
			return strings;
		}
		strings.add("0");
		return strings;
	}
}

