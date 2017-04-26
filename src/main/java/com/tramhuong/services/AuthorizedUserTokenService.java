package com.tramhuong.services;

import com.tramhuong.dto.AuthorizedUserInfo;
import com.tramhuong.services.error.ServiceException;

public interface AuthorizedUserTokenService {
	AuthorizedUserInfo checkAuthorizedUserInfo(String token);
	String logoutAuthorizedUserInfo(String token);
	AuthorizedUserInfo doLogin(String userName, String password) throws ServiceException;

}
