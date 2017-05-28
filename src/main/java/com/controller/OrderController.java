package com.controller;

import com.tramhuong.dto.*;
import com.tramhuong.services.*;
import com.tramhuong.services.error.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class OrderController {
	@Autowired
	private OrderService orderService;
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
		else {
			List<OrderInfoDto> orderInfoDtos = orderService.findAll();
			if(orderInfoDtos == null){
				orderInfoDtos = new ArrayList<OrderInfoDto>();
			}
			model.addAttribute("orders", orderInfoDtos);
		}
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
	public void orderSearch(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("searchOrder") SearchOrderDto searchOrderDto) throws ServiceException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		if (searchOrderDto.getOrderDate() != null) {
			Calendar cal = Calendar.getInstance();
			cal.setTime(searchOrderDto.getOrderDate());
			int date = (cal.get(Calendar.MONTH ) + 1);
			String dateTime = "";
			if(date <10){
				dateTime = "0" + date;
			}else{
				dateTime = dateTime + date;
			}
			String onlyDate = cal.get(Calendar.YEAR) + "-"
					+ dateTime + "-"
					+ cal.get(Calendar.DATE);
			searchOrderDto.setDateSearch(onlyDate);
		}
		List<OrderInfoDto> orderInfoDtos = orderService.findByCondition(
				searchOrderDto.getStatus(), searchOrderDto.getOrderCode(), searchOrderDto.getPaymentType()
				, searchOrderDto.getDateSearch(), searchOrderDto.getName(), searchOrderDto.getTel(), searchOrderDto.getEmail());
		session.setAttribute("orders", orderInfoDtos);
		session.setAttribute("searchOrder", searchOrderDto);
		response.sendRedirect("/admin/orders");
		//return "redirect:/admin/orders";
	}

}
