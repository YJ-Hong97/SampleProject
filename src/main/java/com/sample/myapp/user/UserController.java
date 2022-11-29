package com.sample.myapp.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/user")
public class UserController {
	@Autowired
	UserService userService;

	/* 회원가입 페이지 이동 */
	@RequestMapping(value = "/signup",method = RequestMethod.GET)
	public String signup() {
		return "user/signUp";
	}

	/* 회원 가입 */
	@ResponseBody
	@RequestMapping(value = "/signup",method = RequestMethod.POST)
	public String signup(UserVo user) {
		userService.insertUser(user);
		return "success";
	}

	/* 로그인 페이지 이동 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(){
		return "user/login";
	}
}
