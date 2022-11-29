package com.sample.myapp.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@ResponseBody
	@RequestMapping(value="/checkId", method=RequestMethod.POST)
	public String checkId(@RequestParam("userId")String userId) {
		return userService.checkId(userId);
		
	}
	
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String login() {
		return "login";
	}
	@ResponseBody
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(UserVo user,HttpSession session) {
		UserVo loginUser = userService.login(user);
		System.out.println("dkdk");
		if(loginUser!=null) {
			session.setAttribute("user", loginUser);
			return "success";
		}else {
			return "fail";
		}
	}
}
