package com.sample.myapp.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserController {
	@Autowired
	UserService userService;
	@RequestMapping(value = "/signup",method = RequestMethod.GET)
	public String signup() {
		return "signUp";
	}
	@ResponseBody
	@RequestMapping(value = "/signup",method = RequestMethod.POST)
	public String signup(UserVo user) {
		userService.insertUser(user);
		return "success";
	}
}
