package com.tramhuong.services;

import com.tramhuong.dto.AuthorizedUserInfo;
import com.tramhuong.services.error.ServiceException;

import java.util.List;

public interface AuthorizedUserTokenService {
	AuthorizedUserInfo getByName(String userName) throws ServiceException;
	void updatePassword(AuthorizedUserInfo authorizedUserInfo) throws ServiceException;
	AuthorizedUserInfo findByEmail(String email) throws ServiceException;
	List<AuthorizedUserInfo> findAll() throws ServiceException;
	int add(AuthorizedUserInfo authorizedUserInfo) throws ServiceException;
	void update(AuthorizedUserInfo authorizedUserInfo) throws ServiceException;
}
