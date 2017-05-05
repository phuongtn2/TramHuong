package com.controller;

import com.tramhuong.dto.*;
import com.tramhuong.services.*;
import com.tramhuong.services.error.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.Consumes;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import java.io.UnsupportedEncodingException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class OrderController {
	@Autowired
	private BillingAccountService billingAccountService;
	@Autowired
	private CategoriesService categoriesService;
	@Autowired
	private AboutService aboutService;
	@Autowired
	private BlogService blogService;
	@Autowired
	private MailTransferService mailTransferService;
	@Autowired
	private ProductService productService;
	@Resource
	private Properties setting;
	@Autowired
	private OrderService orderService;
	@Autowired
	private OrderItemService orderItemService;
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}

	@RequestMapping(value = "/admin/orders", method = RequestMethod.GET)
	public String initForm(HttpServletRequest request, ModelMap model) throws ServiceException, UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		List<OrderInfoDto> orders = (List<OrderInfoDto>) session.getAttribute("orders");
		if(orders != null)
			model.addAttribute("orders", orders);
		else
			model.addAttribute("orders", orderService.findAll());
		SearchOrderDto searchOrderDto = (SearchOrderDto) session.getAttribute("searchOrder");
		if(searchOrderDto != null) {
			model.addAttribute("searchOrder", searchOrderDto);
			session.removeAttribute("searchOrder");
		}else{
			model.addAttribute("searchOrder", null);
		}
		session.removeAttribute("orders");
		return "orders";
	}
	@RequestMapping(value = "/admin/orders",method = RequestMethod.POST)
	public String orderSearch(HttpServletRequest request, @ModelAttribute("searchOrder") SearchOrderDto searchOrderDto) throws ServiceException, UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		List<OrderInfoDto> orderInfoDtos = orderService.findByCondition(
				searchOrderDto.getStatus(), searchOrderDto.getOrderCode(), searchOrderDto.getPaymentType()
				, searchOrderDto.getOrderDate(), searchOrderDto.getName(), searchOrderDto.getTel(), searchOrderDto.getEmail());
		session.setAttribute("orders", orderInfoDtos);
		session.setAttribute("searchOrder", searchOrderDto);
		return "redirect:/admin/orders";
	}

}