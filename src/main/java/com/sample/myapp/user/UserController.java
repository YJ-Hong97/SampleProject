package com.sample.myapp.user;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sample.myapp.goods.GoodsDAO;
import com.sample.myapp.goods.GoodsStep1;
import com.sample.myapp.goods.GoodsVo;
import com.sample.myapp.goods.OrderListVo;
import com.sample.myapp.goods.OrderVo;
import com.sample.myapp.order.OrderDAO;

@Controller
@RequestMapping(value = "/auth")
public class UserController {
	@Autowired
	UserDAO userDAO;
	@Autowired
	OrderDAO orderDAO;
	@Autowired
	GoodsDAO goodsDAO;
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
	public String mypage(HttpSession session , Model model) {
		UserVo userVo = (UserVo) session.getAttribute("user");
		model.addAttribute("user",userVo);
		List<OrderVo> orders = orderDAO.selectOrder(userVo.getUserId());
		model.addAttribute("orders",orders);
		Map<String, List<OrderListVo>> orderList = new HashMap<>();
		for(int i = 0;i<orders.size();i++) {
			orderList.put(orders.get(i).getOrderId(),orderDAO.selectOrderList(orders.get(i)));
		}
		List<GoodsStep1> goodsList = new ArrayList<>();
		for(String key:orderList.keySet()) {
			int goodsId = orderList.get(key).get(0).getGoodsId();
			GoodsStep1 goods = goodsDAO.selectIdtoIndex(goodsId);
			goods.setImageUrls(goods.getDbImages().replaceAll("\\[", "").replaceAll("\\]","").split(","));
			goodsList.add(goods);
		}
		model.addAttribute("goodsList",goodsList);
		model.addAttribute("orderList",orderList);
		return "user/mypage";
	}
}
