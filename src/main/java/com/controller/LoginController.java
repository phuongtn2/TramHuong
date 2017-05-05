package com.controller;

import com.tramhuong.dto.AuthorizedUserInfo;
import com.tramhuong.services.AuthorizedUserTokenService;
import com.tramhuong.services.error.ServiceException;
import com.tramhuong.util.str.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

@Controller
public class LoginController {
	@Autowired
	private AuthorizedUserTokenService authorizedUserTokenService;
	private static String convertByteArrayToHexString(byte[] arrayBytes) {
		StringBuffer stringBuffer = new StringBuffer();
		for (int i = 0; i < arrayBytes.length; i++) {
			stringBuffer.append(Integer.toString((arrayBytes[i] & 0xff) + 0x100, 16)
					.substring(1));
		}
		return stringBuffer.toString();
	}

	private static String hashString(String pass, String algorithm) {

		try {
			MessageDigest digest = MessageDigest.getInstance(algorithm);
			byte[] hashedBytes = digest.digest(pass.getBytes("UTF-8"));
			return convertByteArrayToHexString(hashedBytes);
		} catch (NoSuchAlgorithmException | UnsupportedEncodingException ex) {
			return null;
		}
	}

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String redirect(ModelMap model) throws ServiceException {
		return "login";
	}

	@RequestMapping(value = "/admin/login", method = RequestMethod.GET)
	public String initForm(ModelMap model) throws ServiceException {
		return "login";
	}
	/*@RequestMapping("/admin/login")

	public ModelAndView login(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws ServiceException {
		String userName=request.getParameter("userName");
		String password=request.getParameter("password");
		String decodePass = hashString(password, "MD5");
		if(!StringUtil.isEmpty(userName) && !StringUtil.isEmpty(decodePass)){
			AuthorizedUserInfo authenticationInfo = authorizedUserTokenService.doLogin(userName, decodePass);
			if(authenticationInfo != null){
				session.setAttribute("aui", authenticationInfo);
				session.setAttribute("token", authenticationInfo.getToken());
				return new ModelAndView("redirect:/admin/categories", "aui", authenticationInfo);
			}else{
				return new ModelAndView("login", "error", "Có Lỗi");
			}
		}else{
			return new ModelAndView("login", "error", "Có Lỗi");
		}
	}*/
	@RequestMapping("/admin/logout")
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws ServiceException {
		request.getSession().invalidate();
		try {
			SecurityContextHolder.clearContext();
			request.logout();
		} catch (ServletException e) {
			e.printStackTrace();
		}
		return new ModelAndView("login", "aui", null);
	}

	@RequestMapping(value = "admin/accessdenied", method = RequestMethod.GET)
	public String loginerror(ModelMap model) {
		model.addAttribute("error", "Access Denied !!!");
		return "login";
	}
}
