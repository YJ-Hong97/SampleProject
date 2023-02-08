package com.sample.myapp.goodsCategory;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


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
	@RequestMapping("/goodsList_byhi2")
	public String goods(PageVO page, Model model,Integer goodsType) {
		Map<String, Object> map = new HashMap<>();
		map.put("goodsType", goodsType);
		map.put("searchKeyword", null);
		
		int count = goodsDAO.totalCount(map);
		page.setPageList(count);
		
		Map<String, Object> map2 = new HashMap<>();
		map.put("start",page.getStart());
		map.put("size", page.getSize());
		map.put("goodsType", goodsType);
		
		List<GoodsVo> goodsList = goodsDAO.selectAll(map2);
		
		List<GoodsTypeVo> typeList = goodsDAO.selectAllType();
		
		model.addAttribute("typeList",typeList);
		model.addAttribute("goodsList", goodsList);
		model.addAttribute("page", page);
		model.addAttribute("count", count);
		return "user/goodsCategory";

	}
	
	@RequestMapping("/goodsList_byhi")
 	public String goods_orderBy(PageVO page,Model model,@RequestParam(required = false, defaultValue = "-1")Integer goodsType, @RequestParam(required = false, defaultValue = "goods_date desc") String orderBy){
		Map<String, Object> map = new HashMap<>();
		map.put("goodsType", goodsType);
		map.put("searchKeyword", null);
		
		int count = goodsDAO.totalCount(map);
		page.setPageList(count);
		
		map.put("start",page.getStart());
		map.put("size", page.getSize());
		map.put("orderBy", orderBy);
	
		List<GoodsVo> goodsList = goodsDAO.selectOrderBy(map);
		
		/*int a = goodsList.size();
		for(int b=0; b<a; b++) {
			System.out.println(goodsList.get(b).getGoodsId());
		}
		List<String> dbImage=new ArrayList<String>();
		ArrayList<List<String>> mainImage=new ArrayList<List<String>>();
		for(int i=0; i<a; i++) {
			String[] arr=(((goodsList.get(i).getDbGoodsImage().replace("[","")).replace("]","")).split(","));
			for(int j=0; j<arr.length; j++) {
				dbImage.add(arr[j]);
			}
			mainImage.add(dbImage);
			System.out.println("main"+mainImage.size());
		}
		for(int i=0; i<mainImage.size(); i++) {
			System.out.println(mainImage.get(i).get(0));
		}*/
 		model.addAttribute("goodsList",goodsList);
 		model.addAttribute("page",page);
 		model.addAttribute("count",count);
 		model.addAttribute("mainCategory", 1);
 		model.addAttribute("orderBy", orderBy);
 		model.addAttribute("goodsType", goodsType);
 		return "user/goodsCategory_byhi";
 	}
}
