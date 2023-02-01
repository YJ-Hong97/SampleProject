package com.sample.myapp.manager;

import java.awt.Font;


import java.awt.GraphicsEnvironment;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.sample.myapp.PageVO;
import com.sample.myapp.goods.EmojiVo;
import com.sample.myapp.goods.GoodsDAO;
import com.sample.myapp.goods.GoodsTypeVo;
import com.sample.myapp.goods.GoodsVo;

@RequestMapping("/manager")
@Controller
public class ManagerController {

	@Autowired
	GoodsDAO goodsDAO;

	/* 관리자 페이지 이동 */
	@RequestMapping("/")
	public String home() {

		return "admin/admin";
	}

	/* 상품 관리 페이지 이동 */
	@RequestMapping("/goods")
	public String goods(PageVO page, Model model) {
		int count = goodsDAO.totalCount();
		page.setPageList(count);
		List<GoodsVo> goodsList = goodsDAO.selectAll(page);
		model.addAttribute("goodsList", goodsList);
		model.addAttribute("page", page);
		model.addAttribute("count", count);
		return "admin/goods";

	}

	/* 상품 등록 페이지 이동 */
	@RequestMapping(value = "/goods/insert", method = RequestMethod.GET)
	public String insertGoods(Model model, PageVO page) {
		List<GoodsTypeVo> typeList = goodsDAO.selectAllType();

		/* 폰트 가져오기 */
		GraphicsEnvironment e = GraphicsEnvironment.getLocalGraphicsEnvironment();
		Font[] fonts = e.getAllFonts();
		/* 이모지 */
		int count = goodsDAO.countEmojis();
		page.setSize(50);
		page.setPageList(count);
		List<EmojiVo> emojis = goodsDAO.selectAllEmojis(page);
		model.addAttribute("page", page);
		model.addAttribute("emojis", emojis);
		model.addAttribute("typeList", typeList);
		model.addAttribute("fonts", fonts);
		return "admin/insertGoods";
	}

	@ResponseBody
	@RequestMapping(value = "/goods/emojiPage", method = RequestMethod.GET, headers = "Accept=*/*", produces = "application/json; charset=utf-8")
	public List<EmojiVo> emojiPage(PageVO page) {

		int count = goodsDAO.countEmojis();
		page.setSize(50);
		page.setPageList(count);
		List<EmojiVo> emojis = goodsDAO.selectAllEmojis(page);
		return emojis;
	}

	@ResponseBody
	@RequestMapping(value = "/goods/insert", method = RequestMethod.POST)
	public void insertGoods(@ModelAttribute GoodsVo goodsVo,HttpServletRequest request) throws IOException {
		goodsDAO.insertGoods(goodsVo,request);
	}
	/*
	@RequestMapping(value = "/goods/detail",method = RequestMethod.GET)
	public String detailGoods(int goodsId,Model model) {
		GoodsVo goodsVo = goodsDAO.selectGoods(goodsId);
		model.addAttribute("goods",goodsVo);
		return 
	}
	*/
}
