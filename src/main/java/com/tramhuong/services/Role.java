package com.tramhuong.services;

import com.tramhuong.util.str.StringUtil;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public enum Role {
	ORDER()
	, ADMIN();
	private Role() {
		;
	}

	public static List<Role> toRoleList(List<String> roleStrList) {
		final ArrayList<Role> al = new ArrayList<Role>(roleStrList.size());
		for(final String roleStr : roleStrList) {
			try {
				al.add(Role.valueOf(roleStr));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return al;
	}

	public static String toHeaderRoleListValue(Collection<Role> roleCol) {
		if(roleCol==null || roleCol.isEmpty()) {
			return "";
		}
		final ArrayList<String> roleIdList = new ArrayList<String>(roleCol.size());
		for(final Role role : roleCol) {
			roleIdList.add(role.toString());
		}
		return StringUtil.join(roleIdList, ",");
	}
}
