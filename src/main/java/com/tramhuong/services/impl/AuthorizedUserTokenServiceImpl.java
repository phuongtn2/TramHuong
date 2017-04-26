package com.tramhuong.services.impl;

import com.tramhuong.cache.AuthorizedUserTokenCache;
import com.tramhuong.dto.AuthorizedUserInfo;
import com.tramhuong.mapper.AuthorizedUserTokenMapper;
import com.tramhuong.services.AuthorizedUserTokenService;
import com.tramhuong.services.error.ServiceException;
import com.tramhuong.util.str.TokenGenerator;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.Date;
import java.util.Properties;

@Service
public class AuthorizedUserTokenServiceImpl implements
		AuthorizedUserTokenService {
	private static final Logger log = Logger.getLogger(AuthorizedUserTokenServiceImpl.class);
	@Resource
	private Properties setting;

	@Autowired
	private AuthorizedUserTokenCache authCache;

	@Autowired
	private AuthorizedUserTokenMapper authMapper;

	@Autowired
	private ApplicationContext applicationContext;
	private int randomTokenLength = 20;

	@Override
	public AuthorizedUserInfo checkAuthorizedUserInfo(String token) {
		return authCache.findToken(token);
	}


	public AuthorizedUserInfo doLogin(String adId, String password) throws ServiceException {
		AuthorizedUserInfo userInfo = authMapper.findAuthorizedUserInfoByAuth(
				adId, password);
		if (userInfo != null) {
			log.info("adId:" + adId);
			registerUserInfoUserInfo(userInfo);
		}
		return userInfo;
	}

	protected void registerUserInfoUserInfo(AuthorizedUserInfo userInfo)  {
		final int userId = userInfo.getUserId();
		final Date createAt = new Date();
		// generate authenticate token
		final String token = TokenGenerator.create(createAt, userInfo.getUserId(), randomTokenLength);
		userInfo.setToken(token);
		// and save it into cache
		authCache.registerUserInfoToken(userInfo);
	}
	@Override
	public String logoutAuthorizedUserInfo(String token) {
		final AuthorizedUserInfo removed = authCache.removeToken(token);
		return removed != null ? String.valueOf(removed.getUserName()) : "PhuongTN2";
	}

	public void setRandomTokenLength(int len) {
		randomTokenLength = len;
	}

}
