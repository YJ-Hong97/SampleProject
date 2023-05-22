package com.sample.myapp;

import java.util.Arrays;
import java.util.List;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sample.myapp.goods.GoodsDAO;
import com.sample.myapp.goods.GoodsStep1;
import com.sample.myapp.goods.GoodsVo;
import com.sample.myapp.user.UserDAO;
import com.sample.myapp.user.UserVo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private HomeDao homeDao;
	@Autowired
	private GoodsDAO goodsDAO;
	@Autowired
	UserDAO userDAO;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletRequest request,HttpSession session) {

		List<AdsVo> adsList = homeDao.selectAds();
		List<GoodsStep1> goodsList = goodsDAO.selectNewGoods();
		for (int i = 0; i < goodsList.size(); i++) {
			goodsList.get(i).setImageUrls(
					goodsList.get(i).getDbImages().replaceAll("\\[", "").replaceAll("\\]", "").trim().split(","));
			goodsList.get(i).setGoodsColor(goodsList.get(i).getDbGoodsColor().replaceAll("\\[", "").replaceAll("\\]", "").trim().split(","));
		
			String[] colors = goodsList.get(i).getGoodsColor();
			for(int j = 0;j<colors.length;j++) {
			String color= goodsDAO.selectColor(colors[j].trim());
			colors[j] = color;
			}
			goodsList.get(i).setGoodsColor(colors);
		}
		
		/*사용자 정보*/
		UserVo user = new UserVo();
		user.setUserId("hhhyj1077@naver.com");
		user =userDAO.selectUser(user);
		session.setAttribute("user", user);
		/*
		 UserVo user = (UserVo)session.getAttribute("user"); 
		 */
		
		model.addAttribute("user",user);
		model.addAttribute("goodsList", goodsList);
		model.addAttribute("adsList", adsList);
		return "index";
	}

}
