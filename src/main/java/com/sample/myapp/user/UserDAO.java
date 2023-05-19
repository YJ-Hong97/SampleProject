package com.sample.myapp.user;

import org.apache.ibatis.session.SqlSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAO {
	@Autowired
	SqlSession session;
	@Autowired
	PasswordEncoder encoder;

	public void insertUser(UserVo user) {
		user.setUserPw(encoder.encode(user.getUserPw()));
		session.insert("user.userInsert", user);
	}

	public UserVo checkId(String userId) {
		return session.selectOne("user.checkId", userId);
	}
	public UserVo selectUser(UserVo user) {
		return session.selectOne("user.selectUser",user);
	}
	public boolean loginUser(UserVo user) {
		
		UserVo returnUser = session.selectOne("user.selectUser",user);
		if(encoder.matches(user.getUserPw(), returnUser.getUserPw())) {
			return true;
		}else {
			return false;
		}
	}
}
