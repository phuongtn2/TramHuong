package com.tramhuong.dto;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.io.Serializable;
import java.util.*;

public class AuthorizedUserInfo implements UserDetails, Serializable {
	public static final int ADMIN = 1;
	private Integer userId;
	private String userName;
	private String fullName;
	private String mail;
	private String password;
	private String token;
	private byte status;
	private String role;
	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
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

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> grantedAuthorities = new ArrayList<GrantedAuthority>();
		GrantedAuthority g = new GrantedAuthority() {
			@Override
			public String getAuthority() {
				return "ROLE_ADMIN";
			}
		};
		grantedAuthorities.add(g);
		return grantedAuthorities;
	}

	public String getPassword() {
		return password;
	}

	@Override
	public String getUsername() {
		return userName;
	}

	@Override
	public boolean isAccountNonExpired() {
		return status > 0;
	}

	@Override
	public boolean isAccountNonLocked() {
		return status > 0;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return status > 0;
	}

	@Override
	public boolean isEnabled() {
		return status > 0;
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

	public byte getStatus() {
		return status;
	}

	public void setStatus(byte status) {
		this.status = status;
	}

	public AuthorizedUserInfo deepClone()  {
		final AuthorizedUserInfo c = new AuthorizedUserInfo();
		c.setUserId(this.getUserId());
		c.setFullName(this.getFullName());
		c.setUserName(this.getUserName());
		c.setMail(this.getMail());
		c.setToken(this.getToken());
		c.setFullName(this.getFullName());
		c.setRole(this.getRole());
		return c;
	}
	private static Date cloneDate(Date d) {
		return d==null ? null : new Date(d.getTime());
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
}
