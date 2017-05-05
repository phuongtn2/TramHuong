package com.tramhuong.services;

import com.tramhuong.dto.AuthorizedUserInfo;
import com.tramhuong.services.error.ServiceException;

public interface AuthorizedUserTokenService {
	AuthorizedUserInfo getByName(String userName) throws ServiceException;
}
