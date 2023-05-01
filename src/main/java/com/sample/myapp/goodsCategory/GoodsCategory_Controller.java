package com.sample.myapp.goodsCategory;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sample.myapp.PageVO;
import com.sample.myapp.goods.GoodsDAO;
import com.sample.myapp.goods.GoodsStep1;
import com.sample.myapp.goods.GoodsTypeVo;
import com.sample.myapp.goods.GoodsVo;
import com.sample.myapp.love.LoveDAO;
import com.sample.myapp.love.LoveVO;

@RequestMapping("/user")
@Controller
public class GoodsCategory_Controller {

	@Autowired
	GoodsDAO goodsDAO;
	@Autowired
	LoveDAO loveDAO;
	/*메 페이지 이동*/
	@RequestMapping("/")
	public String home() {

		return "index";
	}

	/* 상품 관리 페이지 이동 */
	@RequestMapping("/goodsList_byhi2")
	public String goods(PageVO page,Model model,@RequestParam(required = false, defaultValue = "-1")String userid, @RequestParam(required = false, defaultValue = "0")Integer pageNum, @RequestParam(required = false, defaultValue = "-1")Integer goodsType, @RequestParam(required = false, defaultValue = "goods_date desc") String orderBy){

		Map<String, Object> map = new HashMap<>();
		map.put("goodsType", goodsType);
		map.put("searchKeyword", null);
		int count = goodsDAO.totalCount(map);
		page.setPageList(count);
		page.setPage(pageNum);
		map.put("start",page.getStart());
		map.put("size", page.getSize());
		map.put("orderBy", orderBy);
	
		List<LoveVO> loveList = new ArrayList<>();
		List<GoodsVo> goodsList = goodsDAO.selectOrderBy(map);
		List<String> flag = new ArrayList<String>();
		
		if(userid.equals("-1")) {
			loveList = loveDAO.selectLoveUser("1");
		}else {
			loveList = loveDAO.selectLoveUser(userid);
		}
		int a = goodsList.size();
		for(int b=0; b<a; b++) {
		//	System.out.println(goodsList.get(b).getGoodsId());
		}
		for(int i=0; i<goodsList.size(); i++) {
			for(int j=0; j<loveList.size(); j++) {
			if(goodsList.get(i).getGoodsId()==loveList.get(j).getGoods_id()) {
				flag.add("true");
				break;
			}
			}
			if(flag.size()==i)
			flag.add("false");
		}
		
		

		
		ArrayList<HashMap<String, Object>> mainImage=new ArrayList<HashMap<String,Object>>();
		for(int i=0; i<a; i++) {
			Map<String,Object> dbImage=new HashMap<String, Object>();
			
			List<String> imageList = new ArrayList<String>();
			String name = null;
			int price = 0;
			int goodsid = 0;
			
			GoodsStep1 goods = goodsDAO.selectGoodsIndex(goodsList.get(i).getGoodsIndexId());
			if(goods.getDbImages() == null || goods.getDbImages().isEmpty()) {
				continue;
			}else {
				String[] arr=(((goods.getDbImages().replace("[","")).replace("]","")).split(","));
				for(int j=0; j<arr.length; j++) {
					imageList.add(arr[j]);
					name= goods.getGoodsName();
					price=goods.getGoodsPrice();
					goodsid = goodsList.get(i).getGoodsId();
				}
			}
			dbImage.put("ImageList", imageList);
			dbImage.put("goodsName", name);
			dbImage.put("goodsPrice", price );
			dbImage.put("goodsId", goodsid );
			
			mainImage.add((HashMap<String, Object>) dbImage);
			
		}
		for(int i=0; i<mainImage.size(); i++) {
			System.out.println(mainImage.get(i).get("goodsName"));
		}
		System.out.println(mainImage.toString());
		model.addAttribute("mainImage", mainImage);
 		model.addAttribute("goodsList",goodsList);
 		model.addAttribute("page",page);
 		model.addAttribute("count",count);
 		model.addAttribute("mainCategory", 1);
 		model.addAttribute("orderBy", orderBy);
 		model.addAttribute("goodsType", goodsType);
 		model.addAttribute("flag",flag);
 		return "user/goodsCategory";

	}
	
	@RequestMapping("/goodsList_byhi")
 	public String goods_orderBy(PageVO page,Model model,@RequestParam(required = false, defaultValue = "-1")String userid, @RequestParam(required = false, defaultValue = "0")Integer pageNum, @RequestParam(required = false, defaultValue = "-1")Integer goodsType, @RequestParam(required = false, defaultValue = "goods_date desc") String orderBy){
		Map<String, Object> map = new HashMap<>();
		map.put("goodsType", goodsType);
		map.put("searchKeyword", null);
		int count = goodsDAO.totalCount(map);
		page.setPageList(count);
		page.setPage(pageNum);
		map.put("start",page.getStart());
		map.put("size", page.getSize());
		map.put("orderBy", orderBy);
	
		List<LoveVO> loveList = new ArrayList<>();
		List<GoodsVo> goodsList = goodsDAO.selectOrderBy(map);
		List<String> flag = new ArrayList<String>();
		
		if(userid.equals("-1")) {
			loveList = loveDAO.selectLoveUser("1");
		}else {
			loveList = loveDAO.selectLoveUser(userid);
		}
		int a = goodsList.size();
		for(int b=0; b<a; b++) {
		//	System.out.println(goodsList.get(b).getGoodsId());
		}
		for(int i=0; i<goodsList.size(); i++) {
			for(int j=0; j<loveList.size(); j++) {
			if(goodsList.get(i).getGoodsId()==loveList.get(j).getGoods_id()) {
				flag.add("true");
				break;
			}
			}
			if(flag.size()==i)
			flag.add("false");
		}
		
		

		
		ArrayList<HashMap<String, Object>> mainImage=new ArrayList<HashMap<String,Object>>();
		for(int i=0; i<a; i++) {
			Map<String,Object> dbImage=new HashMap<String, Object>();
			
			List<String> imageList = new ArrayList<String>();
			String name = null;
			int price = 0;
			int goodsid = 0;
			
			GoodsStep1 goods = goodsDAO.selectGoodsIndex(goodsList.get(i).getGoodsIndexId());
			if(goods.getDbImages() == null || goods.getDbImages().isEmpty()) {
				continue;
			}else {
				String[] arr=(((goods.getDbImages().replace("[","")).replace("]","")).split(","));
				for(int j=0; j<arr.length; j++) {
					imageList.add(arr[j]);
					name= goods.getGoodsName();
					price=goods.getGoodsPrice();
					goodsid = goodsList.get(i).getGoodsId();
				}
			}
			dbImage.put("ImageList", imageList);
			dbImage.put("goodsName", name);
			dbImage.put("goodsPrice", price );
			dbImage.put("goodsId", goodsid );
			
			mainImage.add((HashMap<String, Object>) dbImage);
			
		}
		for(int i=0; i<mainImage.size(); i++) {
			System.out.println(mainImage.get(i).get("goodsName"));
		}
		System.out.println(loveList.toString());
		model.addAttribute("mainImage", mainImage);
 		model.addAttribute("goodsList",goodsList);
 		model.addAttribute("page",page);
 		model.addAttribute("count",count);
 		model.addAttribute("mainCategory", 1);
 		model.addAttribute("orderBy", orderBy);
 		model.addAttribute("goodsType", goodsType);
 		model.addAttribute("flag",flag);
 		return "user/goodsCategory_byhi";
 	}
	
	//상품상세페이지
	@RequestMapping("/detail")
	public String detail(PageVO page,Model model,@RequestParam(required = false, defaultValue = "-1")int goodsId) {
		GoodsStep1 goods = goodsDAO.selectGoodsIndex(goodsId);
		System.out.println(goods.toString());
		model.addAttribute("goods",goods);
		return "goods/detail";
	}
}
