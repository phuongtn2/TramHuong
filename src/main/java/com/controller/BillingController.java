package com.controller;

import com.tramhuong.dto.BillingAccountDto;
import com.tramhuong.services.error.ServiceException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.List;

@Controller
@SessionAttributes
public class BillingController {
	@RequestMapping(method = RequestMethod.GET, value = "/checkoutSuccess")
	public String checkout(HttpServletRequest request, ModelMap model) throws ServiceException, UnsupportedEncodingException {
		return "checkoutSuccess";
	}
	@RequestMapping(method = RequestMethod.POST, value = "/saveOrder")
	public String saveOrder(HttpServletRequest request) throws ServiceException, UnsupportedEncodingException {
		return "redirect:/checkoutSuccess";
	}

}
