package com.controller;

import com.tramhuong.dto.PaymentDto;
import com.tramhuong.dto.ShippingDto;
import com.tramhuong.services.CommonService;
import com.tramhuong.services.error.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
public class PaymentShippingController {
	@Autowired
	private CommonService commonService;

	@RequestMapping(value = "/list-payment", method = RequestMethod.GET, headers = "Accept=application/json", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<PaymentDto> getPayment(HttpServletRequest request) throws ServiceException {
		return commonService.findByStatusPayment();
	}

	@RequestMapping(value = "/list-shipping", method = RequestMethod.GET, headers = "Accept=application/json", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<ShippingDto> getShipping(HttpServletRequest request) throws ServiceException {
		return commonService.findByStatusShipping();
	}

}
