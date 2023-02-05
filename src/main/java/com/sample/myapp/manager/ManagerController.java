package com.sample.myapp.manager;

import java.awt.Font;


import java.awt.GraphicsEnvironment;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String goods(PageVO page, Model model,Integer goodsType,String searchKeyword) {
		
		
		Map<String, Object> map = new HashMap<>();
		map.put("goodsType", goodsType);
		map.put("searchKeyword", searchKeyword);
		
		int count = goodsDAO.totalCount(map);
		page.setPageList(count);
		
		map.put("start",page.getStart());
		map.put("size", page.getSize());

		List<GoodsVo> goodsList = goodsDAO.selectAll(map);
		
		List<GoodsTypeVo> typeList = goodsDAO.selectAllType();
		
		model.addAttribute("typeList",typeList);
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
		
		GoodsVo goodsVo = new GoodsVo();
		
		model.addAttribute("goods",goodsVo);
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

	@RequestMapping(value = "/goods/insert", method = RequestMethod.POST)
	public String insertGoods(@ModelAttribute GoodsVo goodsVo,HttpServletRequest request) throws IOException {
		if(goodsVo.getGoodsId()!=0) {
			goodsDAO.updateGoods(goodsVo, request);
		}else {
			goodsDAO.insertGoods(goodsVo,request);
		}
		
		return "redirect:/manager/goods";
	}
	/*상품 상세 페이지로 이동*/
	@RequestMapping(value = "/goods/detail",method = RequestMethod.GET)
	public String detailGoods(int goodsId,Model model) {
		GoodsVo goodsVo = goodsDAO.selectGoods(goodsId);
		String[] dbGoodsImages = goodsVo.getDbGoodsImage().replaceAll("\\[", "").replaceAll("\\]", "").trim().split(",");
		
		model.addAttribute("dbGoodsImages",dbGoodsImages);
		model.addAttribute("goods",goodsVo);
		return "/admin/insertGoods";
	}
	/*상품삭제*/
	@RequestMapping("/goods/delete")
	public String deleteGoods(int goodsId) {
		goodsDAO.deleteGoods(goodsId);
		return "redirect:/manager/goods";
	}
}
