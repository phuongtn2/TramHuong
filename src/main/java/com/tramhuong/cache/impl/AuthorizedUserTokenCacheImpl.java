
package com.tramhuong.cache.impl;

import com.tramhuong.cache.AuthorizedUserTokenCache;
import com.tramhuong.dto.AuthorizedUserInfo;
import org.springframework.stereotype.Service;
import javax.annotation.PostConstruct;
import java.util.*;

@Service

public class AuthorizedUserTokenCacheImpl implements AuthorizedUserTokenCache {

	private final HashMap<String, AuthorizedUserInfo> cacheMap = new HashMap<String, AuthorizedUserInfo>();
	private long expireInterval = 86400000L;
	private long cleaningMinInterval = 600000L;
	private long previous = System.currentTimeMillis();

	@Override
	public AuthorizedUserInfo findToken(String token) {
		final long now = System.currentTimeMillis();
		synchronized (cacheMap) {
			clean(now);
			return cacheMap.get(token);
		}
	}

	@Override
	public void registerUserInfoToken(AuthorizedUserInfo userInfo) {
		final AuthorizedUserInfo caui = userInfo.deepClone();
		final String token = caui.getToken();
		synchronized (cacheMap) {
			cacheMap.put(token, caui);
		}
	}

	@Override
	public AuthorizedUserInfo removeToken(String token) {
		synchronized (cacheMap) {
			return cacheMap.remove(token);
		}
	}

	protected void clean(long now) {
		if (now > previous + cleaningMinInterval) {
			previous = now;
			final long at = now - expireInterval;
			final LinkedList<String> removeKeyList = new LinkedList<String>();
			for (final Map.Entry<String, AuthorizedUserInfo> em : cacheMap.entrySet()) {
				final AuthorizedUserInfo aui = em.getValue();
				//if (aui.getCreateAt().getTime() < at) {
					removeKeyList.add(em.getKey());
				//}
			}
			for (final String key : removeKeyList) {
				cacheMap.remove(key);
			}
		}
	}

	//DI
	public void setExpireInterval(long interval) {
		expireInterval = interval;
	}

	//DI
	public void setcleaningMinInterval(long cleaningMinInterval) {
		this.cleaningMinInterval = cleaningMinInterval;
	}

	@PostConstruct
	public void registerUserInfoBypassAuthToken() {
		synchronized (cacheMap) {
			final AuthorizedUserInfo aui1 = makeAuthorizedUserInfo(
					101, "Admin", "xxxxx");
			registerUserInfoToken(aui1);
		}
	}
	private static AuthorizedUserInfo makeAuthorizedUserInfo(int userID, String userName, String token) {
		final AuthorizedUserInfo aui = new AuthorizedUserInfo();
		aui.setUserId(userID);
		aui.setUserName(userName);
		aui.setToken(token);
		return aui;
	}
}

