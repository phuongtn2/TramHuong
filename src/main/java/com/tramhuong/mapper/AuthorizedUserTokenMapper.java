package com.tramhuong.mapper;


import com.tramhuong.dto.AuthorizedUserInfo;
import org.apache.ibatis.annotations.Param;


public interface AuthorizedUserTokenMapper {
	AuthorizedUserInfo findAuthorizedUserInfoByAuth(@Param("userName") String userName, @Param("password") String password);
}
