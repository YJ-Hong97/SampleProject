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
	public String signupPOST(UserVo user) {
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
		return "user/login";
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
