
package com.tramhuong.cache;


import com.tramhuong.dto.AuthorizedUserInfo;

public interface AuthorizedUserTokenCache {
	public AuthorizedUserInfo findToken(String token);
	public void registerUserInfoToken(AuthorizedUserInfo userInfo);
	public AuthorizedUserInfo removeToken(String token);

}
