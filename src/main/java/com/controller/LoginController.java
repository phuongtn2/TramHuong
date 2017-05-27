package com.controller;

import com.tramhuong.dto.*;
import com.tramhuong.services.AuthorizedUserTokenService;
import com.tramhuong.services.MailTemplateService;
import com.tramhuong.services.MailTransferService;
import com.tramhuong.services.error.ServiceException;
import com.tramhuong.util.str.StringUtil;
import com.tramhuong.util.str.TokenGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.util.Properties;

@Controller
public class LoginController {
	@Autowired
	private AuthorizedUserTokenService authorizedUserTokenService;
	@Autowired
	private MailTemplateService mailTemplateService;
	@Autowired
	private MailTransferService mailTransferService;
	@Resource
	private Properties setting;
	private String md5Encoding(String str) {
		Md5PasswordEncoder pwEncoder = new Md5PasswordEncoder();
		return pwEncoder.encodePassword(str, null);
	}

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public void redirect(HttpServletResponse response) throws ServiceException, IOException {
		response.sendRedirect("/admin/login");
	}

	@RequestMapping(value = "/admin/login", method = RequestMethod.GET)
	public String initForm(HttpServletRequest request,HttpServletResponse response) throws ServiceException, IOException {
		Principal principal = request.getUserPrincipal();
		if(principal != null){
			return "redirect:/admin/categories";
		}else {
			return "login";
		}
	}

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
			/*MailSenderDto mailSenderDto = new MailSenderDto();
			mailSenderDto.setEmail(authorizedUserInfo.getMail());
			mailSenderDto.setFullName("Trầm Hương");
			SendMailPersonalDto sendMailPersonalDto = new SendMailPersonalDto();
			sendMailPersonalDto.setFullName(userInfo.getFullName());
			sendMailPersonalDto.setEmail(userInfo.getMail());
			String sig = mailTemplateDto.getFooter();
			sendMailPersonalDto.setSignature(sig);
			SendMailParameter sendMailParameter = new SendMailParameter();
			sendMailParameter.setToEmail(authorizedUserInfo.getMail());
			sendMailParameter.setSubject("Reset Password");*/
			String body = mailTemplateDto.getHeader()
					+ "<p style='color:red'> Mật khẩu mới: " + password + "</p>"
					+ mailTemplateDto.getFooter();
			//sendMailParameter.setBody(body);
			//mailTransferService.sendCustomerEmail(mailSenderDto, sendMailPersonalDto, sendMailParameter, "RESET-PASSWORD", true);
			final JavaMailSenderImpl mailSender = getMailSender(setting.getProperty("mailTransfer.smtp.server.user"),
					setting.getProperty("mailTransfer.smtp.server.passwd"));
			MimeMessage message = mailSender.createMimeMessage();
			try {
				final String headerCharset = setting.getProperty("mailTransfer.headerCharset");
				MimeMessageHelper helper = new MimeMessageHelper(message, true);

				helper.setFrom(new InternetAddress(setting.getProperty("mailTransfer.smtp.server.user"), setting.getProperty("mailTransfer.infoMailFullName"), headerCharset));
				helper.setTo(authorizedUserInfo.getMail());
				helper.setSubject("Reset Password");
				helper.setText(body, true);
			} catch (MessagingException e) {
				return "reset-password-fail";
			} catch (UnsupportedEncodingException e) {
				return "reset-password-fail";
			}
			mailSender.send(message);
			return "reset-password-success";
		}else{
			return "reset-password-fail";
		}
	}

	public JavaMailSenderImpl getMailSender(String username, String password) {
		final JavaMailSenderImpl mailSender = new JavaMailSenderImpl();

		mailSender.setDefaultEncoding("UTF-8");
		mailSender.setHost(setting.getProperty("mailTransfer.smtp.server"));
		mailSender.setPort(Integer.parseInt(setting.getProperty("mailTransfer.smtp.port")));
		mailSender.setProtocol("smtps");
		mailSender.setUsername(username);
		mailSender.setPassword(password);

		mailSender.setJavaMailProperties(getOutgoingJavaMailProperties());

		return mailSender;
	}

	public Properties getOutgoingJavaMailProperties() {
		final Properties properties = new Properties();
		properties.put("mail.smtp.auth", setting.getProperty("mailTransfer.smtp.auth"));
		properties.put("mail.smtp.starttls.enable", setting.getProperty("mailTransfer.smtp.starttls.enable"));
		return properties;
	}
}
