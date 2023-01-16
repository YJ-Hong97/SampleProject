package com.sample.myapp.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserService {
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	@Autowired
	UserDAO userDAO;
	public void insertUser(UserVo userVo) {
		userVo.setUserPw(passwordEncoder.encode(userVo.getUserPw()));
		userDAO.insertUser(userVo);
	}
	public String checkId(String userId) {
		return userDAO.checkId(userId);
	}
	public UserVo selectUser(UserVo user) {
		return userDAO.selectUser(user);
	}
	public UserVo login(UserVo user) {
		UserVo loginUser = userDAO.selectUser(user);
		if(passwordEncoder.matches(user.getUserPw(),loginUser.getUserPw())) {
			return loginUser;
		}else {
			return null;
		}
		
	}
}
