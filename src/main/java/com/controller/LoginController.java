package com.controller;

import com.tramhuong.dto.AuthorizedUserInfo;
import com.tramhuong.services.AuthorizedUserTokenService;
import com.tramhuong.services.error.ServiceException;
import com.tramhuong.util.str.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {
	@Autowired
	private AuthorizedUserTokenService authorizedUserTokenService;

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String initForm(ModelMap model) throws ServiceException {
		return "login";
	}
	@RequestMapping("/admin/login")
	public ModelAndView login(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws ServiceException {
		String userName=request.getParameter("userName");
		String password=request.getParameter("password");
		if(!StringUtil.isEmpty(userName) && !StringUtil.isEmpty(password)){
			AuthorizedUserInfo authenticationInfo = authorizedUserTokenService.doLogin(userName, password);
			if(authenticationInfo != null){
				session.setAttribute("aui", authenticationInfo);
				return new ModelAndView("redirect:/admin/categories", "aui", authenticationInfo);
			}else{
				return new ModelAndView("login", "error", "Có Lỗi");
			}
		}else{
			return new ModelAndView("login", "error", "Có Lỗi");
		}
	}
	@RequestMapping("/admin/logout")
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws ServiceException {
		authorizedUserTokenService.logoutAuthorizedUserInfo((String) request.getSession().getAttribute("token"));
		request.getSession().invalidate();
		return new ModelAndView("login", "aui", null);
	}
}
