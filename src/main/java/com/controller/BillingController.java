package com.controller;

import com.tramhuong.dto.*;
import com.tramhuong.services.*;
import com.tramhuong.services.error.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.Arrays;
import java.util.List;
import java.util.Properties;

@Controller
@SessionAttributes
public class BillingController {
	@Autowired
	private BillingAccountService billingAccountService;
	@Autowired
	private CategoriesService categoriesService;
	@Autowired
	private AboutService aboutService;
	@Autowired
	private BlogService blogService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private OrderItemService orderItemService;
	@Autowired
	MailTransferService mailTransferService;
	@RequestMapping(method = RequestMethod.GET, value = "/checkoutSuccess")
	public String checkout(HttpServletRequest request, ModelMap model) throws ServiceException, UnsupportedEncodingException {
		List<MappingCategoryDto> mappingCategoryDtos = CommonController.loadCategory(categoriesService);
		model.addAttribute("mapping_categories", mappingCategoryDtos);
		model.addAttribute("mSize", mappingCategoryDtos.size());
		CommonController.loadCommon(request, model, aboutService, blogService);
		return "checkoutSuccess";
	}
	@RequestMapping(method = RequestMethod.POST, value = "/saveOrder")
	public String saveOrder(HttpServletRequest request, @ModelAttribute("orderInfo") OrderInfoDto orderInfoDto) throws ServiceException, UnsupportedEncodingException {

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		CartListDto cartListDto = (CartListDto) session.getAttribute("cartList");
		if(cartListDto != null){
			//orderInfoDto.setDescription(cartListDto.getDescription());
			orderInfoDto.setOrderCode(cartListDto.getOrderCode());
			orderInfoDto.setTotalPrice(cartListDto.getTotalPrice());
			//orderService.add(orderInfoDto);
			if(cartListDto.getCartDtoList() != null){
				for (CartDto cartDto: cartListDto.getCartDtoList()) {
					OrderItemDto orderItemDto = new OrderItemDto();
					orderItemDto.setOrderCode(cartListDto.getOrderCode());
					orderItemDto.setProductId(cartDto.getProductId());
					orderItemDto.setCount(cartDto.getCount());
					//orderItemService.add(orderItemDto);
				}
			}
			//send mail
			AboutDto aboutDto = aboutService.find();
			MailSenderDto mailSenderDto = new MailSenderDto();
			mailSenderDto.setEmail(aboutDto.getEmail());
			mailSenderDto.setFullName("Tram Hương");
			SendMailPersonalDto sendMailPersonalDto = new SendMailPersonalDto();
			sendMailPersonalDto.setFullName(orderInfoDto.getName());
			sendMailPersonalDto.setEmail(orderInfoDto.getEmail());
			sendMailPersonalDto.setTel(orderInfoDto.getTel());
			sendMailPersonalDto.setSignature("phuongtn2");
			SendMailParameter sendMailParameter = new SendMailParameter();
			sendMailParameter.setAttachementURLList(Arrays.asList("localhost:8080"));
			sendMailParameter.setSubject("Mua Sản Phẩm Tram Huong");
			sendMailParameter.setToEmail(orderInfoDto.getEmail());
			sendMailParameter.setBody("----------------");
			mailTransferService.sendCustomerEmail(mailSenderDto, sendMailPersonalDto, sendMailParameter, "ORDER", true);
		}
		return "redirect:/checkoutSuccess";
	}

	@RequestMapping(method = RequestMethod.GET, value = "/page/payment")
	public String payment(HttpServletRequest request, ModelMap model) throws ServiceException, UnsupportedEncodingException {
		List<MappingCategoryDto> mappingCategoryDtos = CommonController.loadCategory(categoriesService);
		model.addAttribute("mapping_categories", mappingCategoryDtos);
		model.addAttribute("mSize", mappingCategoryDtos.size());
		CommonController.loadCommon(request, model, aboutService, blogService);
		List<BillingAccountDto> billingAccountDtos = billingAccountService.findAll();
		model.addAttribute("billings", billingAccountDtos);
		return "payment";
	}
	@RequestMapping(method = RequestMethod.GET, value = "/page/buy")
	public String buy(HttpServletRequest request, ModelMap model) throws ServiceException, UnsupportedEncodingException {
		List<MappingCategoryDto> mappingCategoryDtos = CommonController.loadCategory(categoriesService);
		model.addAttribute("mapping_categories", mappingCategoryDtos);
		model.addAttribute("mSize", mappingCategoryDtos.size());
		CommonController.loadCommon(request, model, aboutService, blogService);
		return "buy";
	}
	@RequestMapping(method = RequestMethod.GET, value = "/page/shipping")
	public String shipping(HttpServletRequest request, ModelMap model) throws ServiceException, UnsupportedEncodingException {
		List<MappingCategoryDto> mappingCategoryDtos = CommonController.loadCategory(categoriesService);
		model.addAttribute("mapping_categories", mappingCategoryDtos);
		model.addAttribute("mSize", mappingCategoryDtos.size());
		CommonController.loadCommon(request, model, aboutService, blogService);
		return "shipping";
	}

}
