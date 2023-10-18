package com.itda.ITDA.service;

import com.itda.ITDA.domain.Admin;

public interface adMemberService {
	public int isId(String id, String Pass);

	public int isId(String id);

	public Admin adminInfo(String adminId);

	public int adminUpdate(Admin admin);
}
