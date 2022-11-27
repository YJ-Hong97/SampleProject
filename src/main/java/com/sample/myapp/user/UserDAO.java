package com.sample.myapp.user;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAO {
	@Autowired
	SqlSession session;
	public void insertUser(UserVo user) {
		session.insert("user.userInsert",user);
	}
}
