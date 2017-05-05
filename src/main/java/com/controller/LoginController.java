package com.controller;

import com.tramhuong.dto.*;
import com.tramhuong.services.AuthorizedUserTokenService;
import com.tramhuong.services.MailTemplateService;
import com.tramhuong.services.MailTransferService;
import com.tramhuong.services.error.ServiceException;
import com.tramhuong.util.str.TokenGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class LoginController {
	@Autowired
	private AuthorizedUserTokenService authorizedUserTokenService;
	@Autowired
	private MailTemplateService mailTemplateService;
	@Autowired
	private MailTransferService mailTransferService;

	private String md5Encoding(String str) {
		Md5PasswordEncoder pwEncoder = new Md5PasswordEncoder();
		return pwEncoder.encodePassword(str, null);
	}

	/*@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String redirect(ModelMap model) throws ServiceException {
		return "redirect:/admin/login";
	}*/

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

	@RequestMapping(value = "/admin/accessdenied", method = RequestMethod.GET)
	public String loginerror(ModelMap model) {
		model.addAttribute("error", "Access Denied !!!");
		return "login";
	}

	@RequestMapping(value = "/admin/change-password", method = RequestMethod.GET)
	public String changePassWord(ModelMap model) {
		return "change-password";
	}

	@RequestMapping( value ="/admin/change-password", method = RequestMethod.POST)
	public String saveNewPassword(@ModelAttribute("user") AuthorizedUserInfo authorizedUserInfo, HttpServletRequest request) throws ServiceException {
		String userName = request.getUserPrincipal().getName();
		authorizedUserInfo.setUserName(userName);
		//Md5 password
		String password = authorizedUserInfo.getPassword();
		authorizedUserInfo.setPassword(md5Encoding(password));
		authorizedUserTokenService.updatePassword(authorizedUserInfo);
		return "change-password-success";
	}

	@RequestMapping(value = "/admin/forgot-password", method = RequestMethod.GET)
	public String forgotPassWord(ModelMap model) {
		return "forgot-password";
	}
	@RequestMapping( value ="/admin/forgot-password", method = RequestMethod.POST)
	public String resetNewPassword(@ModelAttribute("user") AuthorizedUserInfo authorizedUserInfo, HttpServletRequest request) throws ServiceException {
		AuthorizedUserInfo userInfo = authorizedUserTokenService.findByEmail(authorizedUserInfo.getMail());
		//Generate pass
		if(userInfo != null) {
			String password = TokenGenerator.createRandomAkphaNum(10);
			userInfo.setPassword(md5Encoding(password));
			authorizedUserTokenService.updatePassword(userInfo);
			//Send Mail
			MailTemplateDto mailTemplateDto = mailTemplateService.findByCode("PASSWORD");
			MailSenderDto mailSenderDto = new MailSenderDto();
			mailSenderDto.setEmail(authorizedUserInfo.getMail());
			mailSenderDto.setFullName("Trầm Hương");
			SendMailPersonalDto sendMailPersonalDto = new SendMailPersonalDto();
			sendMailPersonalDto.setFullName(userInfo.getFullName());
			sendMailPersonalDto.setEmail(userInfo.getMail());
			String sig = mailTemplateDto.getFooter();
			sendMailPersonalDto.setSignature(sig);
			SendMailParameter sendMailParameter = new SendMailParameter();
			sendMailParameter.setToEmail(authorizedUserInfo.getMail());
			sendMailParameter.setSubject("Reset Password");
			String body = mailTemplateDto.getHeader()
					+ "<p style='color:red'> Mật khẩu mới: " + password + "</p>";
			sendMailParameter.setBody(body);
			mailTransferService.sendCustomerEmail(mailSenderDto, sendMailPersonalDto, sendMailParameter, "RESET-PASSWORD", true);
			return "reset-password-success";
		}else{
			return "reset-password-fail";
		}
	}
}
