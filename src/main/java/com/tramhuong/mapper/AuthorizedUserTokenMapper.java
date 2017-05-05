package com.tramhuong.mapper;


import com.tramhuong.dto.AuthorizedUserInfo;
import org.apache.ibatis.annotations.Param;


public interface AuthorizedUserTokenMapper {
	AuthorizedUserInfo getByName(@Param("userName") String userName);
}
