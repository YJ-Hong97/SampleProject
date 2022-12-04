package com.sample.myapp.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
	@Autowired
	UserDAO userDAO;
	public void insertUser(UserVo userVo) {
		userDAO.insertUser(userVo);
	}
	public String checkId(String userId) {
		return userDAO.checkId(userId);
	}
	public UserVo selectUser(UserVo user) {
		return userDAO.selectUser(user);
	}
	public UserVo login(UserVo user) {
		return userDAO.selectUser(user);
	}
}
