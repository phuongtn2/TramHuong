package com.controller;

import com.tramhuong.dto.AboutDto;
import com.tramhuong.dto.AuthorizedUserInfo;
import com.tramhuong.services.AboutService;
import com.tramhuong.services.AuthorizedUserTokenService;
import com.tramhuong.services.error.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.List;

@Controller
public class AccountController {
	@Autowired
	private AuthorizedUserTokenService authorizedUserTokenService;
	@RequestMapping(value = "/admin/accounts", method = RequestMethod.GET)
	public String initForm(ModelMap model) throws ServiceException {
		List<AuthorizedUserInfo> authorizedUserInfoList = authorizedUserTokenService.findAll();
		if(authorizedUserInfoList != null){
			model.addAttribute("accounts", authorizedUserInfoList);
		}else{
			model.addAttribute("accounts", new ArrayList<AuthorizedUserInfo>());
		}
		return "account";
	}
	@RequestMapping(value = "/admin/account/edit/{name}", method = RequestMethod.GET)
	public String redirectEdit(ModelMap model, @PathVariable String name) throws ServiceException {
		List<AuthorizedUserInfo> authorizedUserInfoList = authorizedUserTokenService.findAll();
		AuthorizedUserInfo authorizedUserInfo = authorizedUserTokenService.getByName(name);
		if(authorizedUserInfoList != null){
			model.addAttribute("accounts", authorizedUserInfoList);
		}else{
			model.addAttribute("accounts", new ArrayList<AuthorizedUserInfo>());
		}
		model.addAttribute("account", authorizedUserInfo);
		return "account";
	}
	@RequestMapping(method = RequestMethod.POST, params = "addAccount")
	public String addAbout(@ModelAttribute("account") AuthorizedUserInfo authorizedUserInfo) throws ServiceException {
		if(authorizedUserInfo.getUserId() != null && authorizedUserInfo.getUserId() > 0){
			authorizedUserTokenService.update(authorizedUserInfo);
		}else{
			authorizedUserTokenService.add(authorizedUserInfo);
		}
		return "redirect:/admin/accounts";
	}
}
