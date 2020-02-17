package com.ds.dao;

import java.util.Map;

import com.ds.taejun.userBean;

public interface UserDAO { 

	/* #### 회원가입 ####*/
	public int regist_user(userBean ub);

	public int email_check(Map<String,Object> map);
	
	public String login(Map<String,Object> map);
	
	public String getName(Map<String,Object> map);
}
