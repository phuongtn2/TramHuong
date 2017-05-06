package com.tramhuong.mapper;


import com.tramhuong.dto.AuthorizedUserInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface AuthorizedUserTokenMapper {
	AuthorizedUserInfo getByName(@Param("userName") String userName);
	void updatePassword(@Param("dto") AuthorizedUserInfo authorizedUserInfo);
	AuthorizedUserInfo findByEmail(@Param("mail") String email);
	List<AuthorizedUserInfo> findAll();
	int add(@Param("dto") AuthorizedUserInfo authorizedUserInfo);
	void update(@Param("dto") AuthorizedUserInfo authorizedUserInfo);
}
