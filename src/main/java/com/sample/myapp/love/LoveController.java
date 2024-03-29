package com.sample.myapp.love;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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
	@RequestMapping(value = "/loveit", method = RequestMethod.GET)
	public String LovePOST(HttpServletRequest request, @RequestParam("userid") String userid,
			@RequestParam("goodsid") int goodsid, Model model) {

		LoveVO love = new LoveVO(4, userid, goodsid);

		loveService.insertLove(love);
		System.out.println(love.toString());
		return "success";
	}
	/*메인페이지에서 찜하기*/
	@ResponseBody
	@RequestMapping("/love")
	public String love(LoveVO love) {
		loveService.insertLove(love);
		return "success";
	}
	/*메인페이지에서 찜취소*/
	@ResponseBody
	@RequestMapping("/notLove")
	public String notLove(LoveVO love) {
		loveService.deleteLove(love);
		return "success";
	}
}
