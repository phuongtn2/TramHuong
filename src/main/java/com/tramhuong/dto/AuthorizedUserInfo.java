package com.tramhuong.dto;

import java.io.Serializable;
import java.util.*;

public class AuthorizedUserInfo implements Serializable {
	public static final int ADMIN = 1;
	private int userId;
	private String userName;
	private String fullName;
	private String mail;
	private String password;
	private String token;

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public AuthorizedUserInfo deepClone()  {
		final AuthorizedUserInfo c = new AuthorizedUserInfo();
		c.setUserId(this.getUserId());
		c.setFullName(this.getFullName());
		c.setUserName(this.getUserName());
		c.setMail(this.getMail());
		c.setToken(this.getToken());
		c.setFullName(this.getFullName());
		return c;
	}
	private static Date cloneDate(Date d) {
		return d==null ? null : new Date(d.getTime());
	}
}
