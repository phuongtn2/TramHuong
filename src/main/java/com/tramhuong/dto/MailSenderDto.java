package com.tramhuong.dto;
public class MailSenderDto {
	private String fullName;
	private String email;
	private String smtpServer;
	private String smtpPassword;
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSmtpServer() {
		return smtpServer;
	}
	public void setSmtpServer(String smtpServer) {
		this.smtpServer = smtpServer;
	}
	public String getSmtpPassword() {
		return smtpPassword;
	}
	public void setSmtpPassword(String smtpPassword) {
		this.smtpPassword = smtpPassword;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((fullName == null) ? 0 : fullName.hashCode());
		result = prime * result + ((smtpPassword == null) ? 0 : smtpPassword.hashCode());
		result = prime * result + ((smtpServer == null) ? 0 : smtpServer.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MailSenderDto other = (MailSenderDto) obj;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (fullName == null) {
			if (other.fullName != null)
				return false;
		} else if (!fullName.equals(other.fullName))
			return false;
		if (smtpPassword == null) {
			if (other.smtpPassword != null)
				return false;
		} else if (!smtpPassword.equals(other.smtpPassword))
			return false;
		if (smtpServer == null) {
			if (other.smtpServer != null)
				return false;
		} else if (!smtpServer.equals(other.smtpServer))
			return false;
		return true;
	}

}
