package com.tramhuong.services.impl;

import com.tramhuong.dto.AuthorizedUserInfo;
import com.tramhuong.mapper.AuthorizedUserTokenMapper;
import com.tramhuong.services.AuthorizedUserTokenService;
import com.tramhuong.services.error.ServiceException;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Repository
public class AuthorizedUserTokenServiceImpl implements
		AuthorizedUserTokenService {
	private static final Logger log = Logger.getLogger(AuthorizedUserTokenServiceImpl.class);

	@Autowired
	private AuthorizedUserTokenMapper authMapper;

	@Override
	public AuthorizedUserInfo getByName(String userName) throws ServiceException {
		return authMapper.getByName(userName);
	}

	@Override
	public void updatePassword(AuthorizedUserInfo authorizedUserInfo) throws ServiceException {
		authMapper.updatePassword(authorizedUserInfo);
	}

	@Override
	public AuthorizedUserInfo findByEmail(String email) throws ServiceException {
		return authMapper.findByEmail(email);
	}

	@Override
	public List<AuthorizedUserInfo> findAll() throws ServiceException {
		return authMapper.findAll();
	}

	@Override
	public int add(AuthorizedUserInfo authorizedUserInfo) throws ServiceException {
		return authMapper.add(authorizedUserInfo);
	}

	@Override
	public void update(AuthorizedUserInfo authorizedUserInfo) throws ServiceException {
		authMapper.update(authorizedUserInfo);
	}

}
