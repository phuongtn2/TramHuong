package com.tramhuong.services.impl;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.tramhuong.dto.MailSenderDto;
import com.tramhuong.dto.SendMailParameter;
import com.tramhuong.dto.SendMailPersonalDto;
import com.tramhuong.services.MailTransferService;
import com.tramhuong.services.error.ServiceException;
import com.tramhuong.util.mail.InlineAttachmentFileUtil;
import com.tramhuong.util.mail.RegexpTemplateMail;
import com.tramhuong.util.str.NumConverter;
import com.tramhuong.util.str.StringUtil;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.mail.*;
import javax.mail.Message.RecipientType;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.*;
import java.util.function.Consumer;
import java.util.regex.Pattern;
@Service
public class MailTransferServiceImpl implements MailTransferService {
	private static final Logger log = Logger.getLogger(MailTransferServiceImpl.class);
	@Resource
	private Properties setting;
	private final HashMap<Pattern, String> urlInlineAttachmentReplaceMap = new HashMap<Pattern, String>();
	private final HashMap<Pattern, String> customerHrefReplaceMap = new HashMap<Pattern, String>();
	//private int mailTransferActMailbodyLen = 1024;

	public void sendCustomerEmail(MailSenderDto sender, SendMailPersonalDto dto, SendMailParameter param, String logPrefix, boolean isFirst) throws ServiceException {
		final String headerCharset = setting.getProperty("mailTransfer.headerCharset");
		final int mailSizeMax = NumConverter.parseIntProperty(setting, "mailTransfer.mailSizeMax");
		final int mailSizeMaxFirst = NumConverter.parseIntProperty(setting, "mailTransfer.mailSizeMaxFirst");
		final String infoMailFullName = setting.getProperty("mailTransfer.infoMailFullName");
		InternetAddress from = null;
		RegexpTemplateMail rtm = null;
		Address[] replyTo;
		try {
			replyTo = new Address[] { new InternetAddress(sender.getEmail(), sender.getFullName(), headerCharset) };
			from = new InternetAddress(sender.getEmail(), infoMailFullName + " " + sender.getFullName(), headerCharset);
			rtm = createCustomerTemplateMail(param, dto);
		} catch (MessagingException | IOException e) {
			e.printStackTrace();
			throw new ServiceException("mail.emailCreateError", e, logPrefix, "ERROR", 0, 0, 0);
		}
		long mailSize = -1L;
		final Session session  = createSendSession();
		final List<String> toAddressList = findSendEmailAddress(sender, dto);
		final Date sentDate = new Date();
		for (int i = 0; i < toAddressList.size(); i++) {
			final MimeMessage mm = new MimeMessage(session);
			try {
				mm.setContent(rtm.getMimeMultipart(), "multipart/mixed");
				mm.setSubject(rtm.getSubject(), headerCharset);
				mm.setReplyTo(replyTo);
				mm.setFrom(from);
				mm.setSentDate(sentDate);
				final InternetAddress toAddress;
				final String customerName = dto.getFullName();
				toAddress = new InternetAddress(toAddressList.get(i), customerName, headerCharset);
				mm.addRecipient(RecipientType.TO, toAddress);

				//if (StringUtil.notEmpty(dto.getCcEmail())) {
					final InternetAddress managerAddress = new InternetAddress(sender.getEmail(), infoMailFullName + " " + sender.getFullName(), headerCharset);
					mm.addRecipient(RecipientType.CC, managerAddress);
				//}
				mailSize = messageLength(mm); ////mm.getSize();
			} catch (MessagingException |IOException e) {
				e.printStackTrace();
				throw new ServiceException("mail.emailCreateError2", e, logPrefix, "ERROR2", 0, 0, 0, mailSize);
			}
			if (mailSize > ((i == 0 && isFirst) ? mailSizeMaxFirst : mailSizeMax)) {
				throw new ServiceException("mail.emailOverSize", logPrefix, "ERROROVERSIZE", 0, 0, 0);
			}
			try {
				send(mm);
			} catch (MessagingException e) {
				e.printStackTrace();
				throw new ServiceException("mail.emailSendError", e, logPrefix, "SENDERROR", 0, 0, 0);
			}
		}
	}
	private long messageLength(Message message) throws MessagingException,IOException {
		try {
			final ByteArrayOutputStream baos = new ByteArrayOutputStream();
			message.writeTo(baos);
			return baos.size();
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	protected RegexpTemplateMail createCustomerTemplateMail(SendMailParameter param, SendMailPersonalDto dto) throws MessagingException, IOException {
		final String cssBody = InlineAttachmentFileUtil.loadUTF8StringContent(urlInlineAttachmentReplaceMap, setting.getProperty("mailTransfer.customerCssPath"));
		final String webBeacon = setting.getProperty("mailTransfer.webBeacon");
		final StringBuilder buf = new StringBuilder();
		buf.append("<html><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">");
		// add this meta to make sure beacon load each time users open the mail
		buf.append("<meta http-equiv=\"cache-control\" content=\"no-cache\" />");
		if(cssBody!=null) {
			buf.append("<style type=\"text/css\">").append(cssBody).append("</style>");
		}
		buf.append("</head><body>");
		// prepare body ending and insert web beacon while sending real mail
		final StringBuilder bodyPostfix = new StringBuilder();
		bodyPostfix.append(webBeacon);
		bodyPostfix.append("</body></html>");
		final RegexpTemplateMail rtm = new RegexpTemplateMail(true, param.getSubject(), buf.toString(), (param.getBody()+dto.getSignature()), bodyPostfix.toString());
		rtm.setReplacementMap(makeReplaceMentMap(dto));
		rtm.setUrlReplaceMap(urlInlineAttachmentReplaceMap);
		if (param.getAttachementURLList() != null) {
			for (final String resourceLocation : param.getAttachementURLList()) {
				rtm.addAttachment(resourceLocation);
			}
		}
		rtm.evalMimeMultipart();
		return rtm;
	}

	protected static Map<String, String> makeReplaceMentMap(SendMailPersonalDto dto) {
		final HashMap<String, String> map = new HashMap<String, String>();
		map.put("personal_fullName", dto.getFullName());
		map.put("myEMail", dto.getEmail());
		map.put("myTEL", dto.getTel());
		return map;
	}
	protected void send(MimeMessage mm) throws MessagingException {
		final String sendAddressPattern = setting.contains("mailTransfer.smtp.address.pattern")?null : setting.getProperty("mailTransfer.smtp.address.pattern");
		if(sendAddressPattern!=null) {
			final Pattern p = Pattern.compile(sendAddressPattern);
			for(Address a : mm.getAllRecipients()) {
				if(a instanceof InternetAddress) {
					final InternetAddress ia = (InternetAddress)a;
					final String addr = ia.getAddress();
					if(! p.matcher(addr).find()) {
						throw new MessagingException("blocking address:"+ia);
					}
				}
			}
		}
		log.info("sending email:"+mm);
		Transport.send(mm);;
	}
	protected static Address makeAddress(String mailAddress, String privateStr, String headerCharset) throws AddressException, UnsupportedEncodingException {
		if(StringUtil.isEmpty(privateStr)) {
			return new InternetAddress(mailAddress);
		} else {
			return new InternetAddress(mailAddress, privateStr, headerCharset);
		}
	}
	protected static List<String> findSendEmailAddress(MailSenderDto sender, SendMailPersonalDto dto) {
			final ArrayList<String> al = new ArrayList<String>(4);
			final Consumer<String> consumer = (String s) -> {
				if(StringUtil.notEmpty(s)) {
					al.add(s);
				}
			};
			consumer.accept(dto.getEmail());
			return al;

	}

	protected Session createSendSession() {
		final Properties prop = new Properties();
		prop.put("mail.smtp.host", setting.getProperty("mailTransfer.smtp.server"));
		prop.put("mail.smtp.port", NumConverter.parseIntProperty(setting, "mailTransfer.smtp.port", 25));
		prop.put("mail.smtp.debug", NumConverter.parseBoolProperty(setting, "mailTransfer.smtp.debug", false));
		prop.put("mail.smtp.allow8bitmime", NumConverter.parseBoolProperty(setting, "mailTransfer.smtp.8bitmime", false));

		final boolean smtpAuth = NumConverter.parseBoolProperty(setting, "mailTransfer.smtp.auth");
		prop.put("mail.smtp.auth", smtpAuth);
		if (smtpAuth) {
			prop.put("mail.smtp.starttls.enable", NumConverter.parseBoolProperty(setting, "mailTransfer.smtp.starttls"));
			final String user = setting.getProperty("mailTransfer.smtp.server.user");
			final String password = setting.getProperty("mailTransfer.smtp.server.passwd");

			final Session session = Session.getInstance(prop, new PasswordAuthenticator(user, password));
			return session;
		} else {
			final Session session = Session.getInstance(prop);

			return session;
		}
	}

	protected static class PasswordAuthenticator extends javax.mail.Authenticator {
		private final String user;
		private final String password;
		public PasswordAuthenticator(String user, String password) {
			this.user = user;
			this.password = password;
		}
		protected PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication(user, password);
		}
	}
	@PostConstruct
	public void initPathPatternList() {
		final String json = setting.getProperty("mailTransfer.urlRegexps");
		if(StringUtil.notEmpty(json)) {
			urlInlineAttachmentReplaceMap.putAll(parseReplaceRuleMap(json));
		}
		final String json2 = setting.getProperty("mailTransfer.customerHrefRegexps");
		if(StringUtil.notEmpty(json2)) {
			customerHrefReplaceMap.putAll(parseReplaceRuleMap(json2));
		}
		final int len = NumConverter.parseIntProperty(setting, "mailTransfer.act.length", 1024);
	}

	protected static Map<Pattern, String> parseReplaceRuleMap(String ruleStr) {
		final LinkedHashMap<Pattern, String> map = new LinkedHashMap<Pattern, String>();
		if (ruleStr != null) {
			final ObjectMapper om = new ObjectMapper();
			try {
				@SuppressWarnings("unchecked")
				final Map<String, String> smap = (Map<String, String>) om.readValue(ruleStr, new TypeReference<LinkedHashMap<String,String>>(){});
				for (final Map.Entry<String, String> me : smap.entrySet()) {
					final Pattern p = Pattern.compile(me.getKey());
					map.put(p, me.getValue());
				}
			} catch (IOException e) {
				return null;
			}
		}
		return map;
	}
}
