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
}
