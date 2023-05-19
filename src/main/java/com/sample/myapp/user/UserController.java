package com.sample.myapp.user;



import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/auth")
public class UserController {
	@Autowired
	UserDAO userDAO;
	/*로그인페이지로 이동*/
	@RequestMapping("/login")
	public String login() {
		return "auth/login";
	}
	/*회원가입 페이지로 이동*/
	@RequestMapping("/signup")
	public String signup() {
		return "auth/signup";
	}
	/*회원가입*/
	@RequestMapping(value = "signup",method =RequestMethod.POST)
	public String signup2(UserVo user) {
		user.setUserId(user.getUserEmail());
		userDAO.insertUser(user);
		return "redirect:/";
	}
	/*이메일 중복 검사*/
	@ResponseBody
	@RequestMapping("/checkEmail")
	public String checkEmail(String userEmail) {
		UserVo user = userDAO.checkId(userEmail);
		if(user!=null) {
			return "fail";
		}else {
			return "success";
		}
		
	}
	/*로그인하기*/
	@RequestMapping(value = "/login",method = RequestMethod.POST)
	public String Authenticate(UserVo user,HttpSession session) {
		boolean result = userDAO.loginUser(user);
		if(result) {
			session.setAttribute("user", user);
			System.out.println("로그인성");
			return "redirect:/";
		}else {
			return "redirect:/auth/login";
		}
	}
	/*마이페이지*/
	@RequestMapping("/mypage")
	public String mypage(UserVo userVo, Model model) {
		model.addAttribute("user",userVo);
		return "user/mypage";
	}
}
