package com.sample.myapp.goodsCategory;

import java.util.List;

import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sample.myapp.PageVO;
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
}
