package com.sample.myapp.love;

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
public class LoveController {
	@Autowired
	LoveService loveService;

	/* 찜콩 */
	@ResponseBody
	@RequestMapping(value = "/loveit",method = RequestMethod.POST)
	public String LovePOST(LoveVO love) {
		loveService.insertLove(love);
		return "success";
	}
	
	
	
}
