package com.controller.bean;

import com.tramhuong.services.error.ServiceException;
import com.tramhuong.services.impl.AuthorizedUserTokenServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

/**
 * package vn.azteam.tabasupport.core.service.impl
 * created 12/14/2016.
 *
 * @author hieunc.
 * @version 1.0.0
 * @link http://azteam.vn
 * @see UserDetailsService
 * @since 1.0.0
 */
public class OAuth2UserDetailServiceImpl implements UserDetailsService {
	@Autowired
	private AuthorizedUserTokenServiceImpl authorizedUserTokenService;

	/**
	 * {@inheritDoc}
	 */
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		try {
			return authorizedUserTokenService.getByName(username);
		} catch (ServiceException e) {
			e.printStackTrace();
			return null;
		}
	}
}
