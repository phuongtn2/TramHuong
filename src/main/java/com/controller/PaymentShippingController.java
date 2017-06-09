package com.controller;

import com.tramhuong.dto.BillingAccountDto;
import com.tramhuong.dto.PaymentDto;
import com.tramhuong.dto.ShippingDto;
import com.tramhuong.services.CommonService;
import com.tramhuong.services.error.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

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

	@RequestMapping(value = "/admin/payments", method = RequestMethod.GET)
	public String initPayment(ModelMap model) throws ServiceException {
		List<PaymentDto> paymentDtos = commonService.findAllPayment();
		model.addAttribute("payments", paymentDtos);
		return "payments";
	}
	@RequestMapping(method = RequestMethod.POST, params = "addPayment")
	public void addPayment(@ModelAttribute("payment") PaymentDto paymentDto, HttpServletResponse response) throws ServiceException, IOException {
		if(paymentDto.getId() != null && paymentDto.getId() > 0){
			commonService.updatePayment(paymentDto);
		}else{
			commonService.addPayment(paymentDto);
		}
		response.sendRedirect("/admin/payments");
	}
	@RequestMapping(value = "/admin/payment/edit/{id}", method = RequestMethod.GET)
	public String getEdit(@PathVariable int id, Model model, HttpServletRequest request)  throws ServiceException {
		PaymentDto paymentDto = commonService.findByIdPayment(id);
		model.addAttribute("payment",paymentDto);
		return "payment-add";
	}
	@RequestMapping(value = "/admin/payment", method = RequestMethod.GET)
	public String getAdd(Model model, HttpServletRequest request)  throws ServiceException {
		model.addAttribute("payment", new PaymentDto());
		return "payment-add";
	}
	@RequestMapping(value = "/admin/payment/edit/{id}", method = RequestMethod.POST)
	public void saveEdit(HttpServletResponse response, @ModelAttribute("payment") PaymentDto paymentDto, @PathVariable int id) throws ServiceException, IOException {
		commonService.updatePayment(paymentDto);
		response.sendRedirect("/admin/payments");
	}

	@RequestMapping(value = "/admin/shippings", method = RequestMethod.GET)
	public String initShipping(ModelMap model) throws ServiceException {
		List<ShippingDto> shippingDtos = commonService.findAllShipping();
		model.addAttribute("shippings", shippingDtos);
		return "shippings";
	}
	@RequestMapping(method = RequestMethod.POST, params = "addShipping")
	public void addShipping(@ModelAttribute("shipping") ShippingDto shippingDto, HttpServletResponse response) throws ServiceException, IOException {
		if(shippingDto.getId() != null && shippingDto.getId() > 0){
			commonService.updateShipping(shippingDto);
		}else{
			commonService.addShipping(shippingDto);
		}
		response.sendRedirect("/admin/shippings");
	}
	@RequestMapping(value = "/admin/shipping/edit/{id}", method = RequestMethod.GET)
	public String getEditShipping(@PathVariable int id, Model model, HttpServletRequest request)  throws ServiceException {
		ShippingDto shippingDto = commonService.findByIdShipping(id);
		model.addAttribute("shipping",shippingDto);
		return "shipping-add";
	}
	@RequestMapping(value = "/admin/shipping", method = RequestMethod.GET)
	public String getAddShipping(Model model, HttpServletRequest request)  throws ServiceException {
		model.addAttribute("shipping", new ShippingDto());
		return "shipping-add";
	}
	@RequestMapping(value = "/admin/shipping/edit/{id}", method = RequestMethod.POST)
	public void saveEditShipping(HttpServletResponse response, @ModelAttribute("shipping") ShippingDto shippingDto, @PathVariable int id) throws ServiceException, IOException {
		commonService.updateShipping(shippingDto);
		response.sendRedirect("/admin/shippings");
	}

}
