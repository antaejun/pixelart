package com.ds.daoi;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ds.dao.UserDAO;
import com.ds.taejun.userBean;

@Service
public class UserDAOImpl implements UserDAO{

	@Autowired
	@Resource(name = "sqlSession")
	private SqlSession sqlSession = null;

	@Override
	public int regist_user(userBean ub) {	
		System.out.println(ub.getEmail());
		// TODO Auto-generated method stub
		return sqlSession.insert("User.regist_user",ub);
	}

	@Override
	public int email_check(Map<String,Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("User.email_check",map);
	}

	@Override
	public String login(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("User.login",map);
	}

	@Override
	public String getName(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("User.getName",map);
	}

	
}

