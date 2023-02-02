package com.sample.myapp.goodsCategory;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sample.myapp.PageVO;
import com.sample.myapp.goods.GoodsComparator;
import com.sample.myapp.goods.GoodsDAO;
import com.sample.myapp.goods.GoodsVo;
@RequestMapping("/user")
@Controller
public class GoodsCategory_Controller {

	@Autowired
	GoodsDAO goodsDAO;
	/*메 페이지 이동*/
	@RequestMapping("/")
	public String home() {

		return "home";
	}

	/*상품 관리 페이지 이동*/
	@RequestMapping("/goodsList")
	public String goods(PageVO page,Model model){
		int count = goodsDAO.totalCount();
		page.setPageList(count);
		List<GoodsVo> goodsList = goodsDAO.selectAll(page);
		model.addAttribute("goodsList",goodsList);
		model.addAttribute("page",page);
		model.addAttribute("count",count);
		return "user/goodsCategory";

	}
	@RequestMapping("/goodsList_byhi")
	public String goods_hi(PageVO page,Model model){
		int count = goodsDAO.totalCount();
		page.setPageList(count);
		List<GoodsVo> goodsList = goodsDAO.selectAll(page);
		List<String> goodsOption = goodsDAO.selectOption();
		model.addAttribute("goodsList",goodsList);
		model.addAttribute("page",page);
		model.addAttribute("count",count);
		model.addAttribute("mainCategory", 1);
		model.addAttribute("option",goodsOption);
		return "user/goodsCategory_byhi";
	}
	
	@RequestMapping("/goodsList_byhi2")
	public String processSort(PageVO page,Model model, ModelAndView view, HttpServletRequest request,
			@RequestParam("order_by")String order_by) {
		//page처리
		int count = goodsDAO.totalCount();
		page.setPageList(count);
		//정렬기준 처리
		GoodsComparator com = new GoodsComparator();
		com.order_by = order_by;
		List<GoodsVo> goodsList = goodsDAO.selectAll(page);
		Collections.sort(goodsList,com); 
		
		model.addAttribute("goodsList",goodsList);
		model.addAttribute("page",page);
		model.addAttribute("count",count);
		model.addAttribute("mainCategory", 1);
		return "user/goodsCategory_byhi";
	}
}
