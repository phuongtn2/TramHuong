package com.tramhuong.dto;
import java.util.List;

public class SendMailParameter {

	private String subject;
	private String body;
	private List<String> attachementURLList;
	private String toEmail;

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public List<String> getAttachementURLList() {
		return attachementURLList;
	}

	public void setAttachementURLList(List<String> attachementURLList) {
		this.attachementURLList = attachementURLList;
	}

	public String getToEmail() {
		return toEmail;
	}

	public void setToEmail(String toEmail) {
		this.toEmail = toEmail;
	}
}
