package com.tramhuong.util.mail;

import com.tramhuong.util.regexp.RegexpTemplate;
import com.tramhuong.util.str.StringUtil;
import org.springframework.util.CollectionUtils;

import javax.mail.MessagingException;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.MessageFormat;
import java.util.*;
import java.util.Map.Entry;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RegexpTemplateMail {
	protected static final String BODY_TEXT_MIME_PATTERN = "text/*";
	protected static final String BODY_IMAGE_MIME_PATTERN = "image/*";
	protected static final String DEFAULT_CONTENT_TYPE = "text/html";
	protected static final String DEFAULT_CHARSET = "UTF-8";
	protected static final String DEFAULT_FILENAME_CHARSET = "UTF-8";
	private static final Pattern SRC_ATTRIBUTE_PATTERN  = Pattern.compile("(src=\")([^\"]+)(\")", Pattern.MULTILINE|Pattern.CASE_INSENSITIVE);
	private static final Pattern LINK_HREF_PATTERN = Pattern.compile("(href=\")([^\"]+)(\")", Pattern.MULTILINE|Pattern.CASE_INSENSITIVE);
	private static final String TEXT_TRANSCODE = "base64";
	private final boolean isCidReplace;
	private final String subject;
	private String bodyPrefix;
	private String bodyPostfix;
	private final String htmlBody;
	private final List<String> attachmentList = new ArrayList<String>();
	private final Map<String, String> inlineMap = new HashMap<String, String>();
	private final Map<String, String> replacementMap = new HashMap<String, String>();
	private Map<Pattern, String> urlReplacePattern = null;
	private Map<Pattern, String> parameterReplacePattern = null;
	private MimeMultipart mm = null;
	private String replacedSubject = null;
	private String replacedBody = null;

	public RegexpTemplateMail(boolean isCidReplace, String subject, String bodyPrefix, String htmlBody, String bodyPostfix) {
		this.isCidReplace = isCidReplace;
		this.subject = subject;
		this.htmlBody = htmlBody;
		//
		this.bodyPrefix = bodyPrefix;
		this.bodyPostfix = bodyPostfix;
	}
	public void setReplacementMap(Map<String, String> rm) {
		synchronized (replacementMap) {
			replacementMap.clear();
			if(rm!=null) {
				replacementMap.putAll(rm);
			}
		}
	}
	public void setUrlReplaceMap(Map<Pattern, String> urlReplacePattern) {
		this.urlReplacePattern = urlReplacePattern;
	}
	public void setParameterReplacePattern(Map<Pattern, String> parameterReplacePattern) {
		this.parameterReplacePattern = parameterReplacePattern;
	}
	public void addAttachment(String attachmentURL) {
		attachmentList.add(attachmentURL);
	}
	public void putContentLocationInline(String url, String location) {
		inlineMap.put(url, location);
	}
	public void evalMimeMultipart() throws MessagingException, IOException {
		final LinkedHashMap<String, String> urlCidMap = new LinkedHashMap<String, String>();
		String replacedInlineHtmlBody = isCidReplace ? inlineImageInclude(htmlBody, urlCidMap) : htmlBody;
		if(parameterReplacePattern!=null) {
			replacedInlineHtmlBody = replaceHrefParameter(replacedInlineHtmlBody);
		}
		final RegexpTemplate rt = new RegexpTemplate();
		rt.storeReplaceMap(replacementMap);
		replacedSubject = rt.replaceAll(subject);
		replacedBody = rt.replaceAll(replacedInlineHtmlBody);
		final MimeMultipart multipart = new MimeMultipart();

		final MimeBodyPart htmlPart = new MimeBodyPart();

		htmlPart.setText(bodyPrefix+replacedBody+bodyPostfix, DEFAULT_CHARSET, "html");
		htmlPart.setHeader("Content-Transfer-Encoding", TEXT_TRANSCODE);
		multipart.addBodyPart(htmlPart);
		for(final Entry<String, String> me : inlineMap.entrySet()) {
			addInline(multipart, me.getKey(), null, me.getValue());
		}
		for(final Entry<String, String> me : urlCidMap.entrySet()) {
			addInline(multipart, me.getKey(), me.getValue(), null);
		}
		if(CollectionUtils.isEmpty(attachmentList)) {
			multipart.setParent(null);
			mm = multipart;
		} else {
			for(final String resourceLocation : attachmentList) {
				addAttachment(multipart, resourceLocation);
			}
			mm = multipart;
		}
	}
	public MimeMultipart getMimeMultipart() {
		return mm;
	}

	public String getSubject() {
		return replacedSubject;
	}

	public String getMainBody() {
		return replacedBody;
	}
	public String getAllBody() {
		return bodyPrefix+replacedBody+bodyPostfix;
	}
	protected static String inlineImageInclude(String srcBody, LinkedHashMap<String, String> urlCidMap) throws IOException, MessagingException {
		final Matcher m = SRC_ATTRIBUTE_PATTERN.matcher(srcBody) ;
		int counter = 1;
		final StringBuffer buf = new StringBuffer();

		while(m.find()) {
			final String url = m.group(2);
			final String cid;
			if(urlCidMap.containsKey(url)) {
				cid = urlCidMap.get(url);
			} else {
				final int lidx = url.lastIndexOf("/");
				final String fileName =url.substring(lidx+1);

				final String encFileName = URLEncoder.encode(fileName, "UTF-8");
				cid = MessageFormat.format("img_{0}_{1}@gmail.com", String.valueOf(counter++), encFileName);
				urlCidMap.put(url, cid);
			}
			m.appendReplacement(buf, MessageFormat.format("{0}cid:{1}{2}", m.group(1), cid, m.group(3)));
		}
		m.appendTail(buf);
		return buf.toString();
	}
	protected String replaceHrefParameter(String srcBody) throws IOException, MessagingException {
		final Matcher m = LINK_HREF_PATTERN.matcher(srcBody) ;
		final StringBuffer buf = new StringBuffer();
		while(m.find()) {
			final String url = m.group(2);
			String extParam = "";
			for(Entry<Pattern, String> me : parameterReplacePattern.entrySet()) {
				if(me.getKey().matcher(url).matches()){
					extParam = me.getValue();
					break;
				}
			}
			m.appendReplacement(buf, MessageFormat.format("{1}{2}{0}{3}", extParam, m.group(1), url,m.group(3)));
		}
		m.appendTail(buf);
		return buf.toString();
	}

	protected void addInline(MimeMultipart parent, String resourceLocation, String cid, String contentLocation) throws MessagingException, UnsupportedEncodingException {
		final MimeBodyPart mbp = new MimeBodyPart();
		mbp.setDataHandler(InlineAttachmentFileUtil.createDataHandler(urlReplacePattern, resourceLocation));
		mbp.setFileName(formatMimeFileName(DEFAULT_FILENAME_CHARSET, resourceLocation));
		mbp.setDisposition(null);
//		mbp.setDisposition("inline");
		if(StringUtil.notEmpty(cid)) {
			mbp.setContentID("<"+cid+">");
		}
		if(StringUtil.notEmpty(contentLocation)) {
			mbp.setHeader("Content-Location", contentLocation);
		}
		parent.addBodyPart(mbp);
	}

	protected void addAttachment(MimeMultipart parent, String resourceLocation) throws MessagingException, UnsupportedEncodingException {
		final MimeBodyPart mbp = new MimeBodyPart();
		mbp.setDataHandler(InlineAttachmentFileUtil.createDataHandler(urlReplacePattern,resourceLocation));
		mbp.setFileName(formatMimeFileName(DEFAULT_FILENAME_CHARSET, resourceLocation));
		mbp.setDisposition("attachment");
		parent.addBodyPart(mbp);
	}
	protected static String formatMimeFileName(String charset, String path) throws UnsupportedEncodingException {
		final int idx1 = path.indexOf(':');
		final String fpath = (idx1>=0) ? path.substring(idx1+1) : path;
		final int idx2 = fpath.lastIndexOf('/');
		final String name = (idx2>=0) ? fpath.substring(idx2+1) : fpath ;
		return MimeUtility.encodeText(name, charset, null);
	}

}
