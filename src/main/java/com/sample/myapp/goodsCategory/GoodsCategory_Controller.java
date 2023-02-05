package com.sample.myapp.goodsCategory;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sample.myapp.PageVO;
import com.sample.myapp.goods.GoodsDAO;
import com.sample.myapp.goods.GoodsTypeVo;
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

	/* 상품 관리 페이지 이동 */
	@RequestMapping("/goods")
	public String goods(PageVO page, Model model,Integer goodsType) {
		int count = goodsDAO.totalCount(goodsType);
		page.setPageList(count);
		
		Map<String, Integer> map = new HashMap<>();
		map.put("start",page.getStart());
		map.put("size", page.getSize());
		map.put("goodsType", goodsType);
		
		List<GoodsVo> goodsList = goodsDAO.selectAll(map);
		
		List<GoodsTypeVo> typeList = goodsDAO.selectAllType();
		
		model.addAttribute("typeList",typeList);
		model.addAttribute("goodsList", goodsList);
		model.addAttribute("page", page);
		model.addAttribute("count", count);
		return "admin/goods";

	}
	
	@RequestMapping("/goodsList_byhi")
 	public String goods_orderBy(PageVO page,Model model,@RequestParam(required = false, defaultValue = "")Integer goodsType, @RequestParam(required = false, defaultValue = "goods_date desc") String orderBy){
		int count = goodsDAO.totalCount(goodsType);
		page.setPageList(count);
		
		Map<String, Object> map = new HashMap<>();
		map.put("start",page.getStart());
		map.put("size", page.getSize());
		map.put("goodsType", goodsType);
		map.put("orderBy", orderBy);
	
		List<GoodsVo> goodsList = goodsDAO.selectOrderBy(map);
		
 		model.addAttribute("goodsList",goodsList);
 		model.addAttribute("page",page);
 		model.addAttribute("count",count);
 		model.addAttribute("mainCategory", 1);
 		model.addAttribute("orderBy", orderBy);
 		model.addAttribute("goodsType", goodsType);
 		return "user/goodsCategory_byhi";

 	}
}
