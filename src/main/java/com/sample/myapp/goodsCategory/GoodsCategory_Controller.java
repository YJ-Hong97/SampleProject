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
import com.sample.myapp.goods.GoodsSmallType;
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
	@RequestMapping("/goodsList")

	public String goods(PageVO page,Model model,@RequestParam(required = false, defaultValue = "-1")String userid, @RequestParam(required = false, defaultValue = "0")Integer pageNum, @RequestParam(required = false, defaultValue = "-1")Integer goodsType, @RequestParam(required = false, defaultValue = "goods_date desc") String orderBy){

		Map<String, Object> map = new HashMap<>();
		map.put("goodsType", goodsType);
		map.put("searchKeyword", null);
		int count = goodsDAO.totalCount(map);
		page.setPageList(count);
		page.setPage(pageNum);
		map.put("start", page.getStart());
		map.put("size", page.getSize());

		map.put("orderBy", orderBy);
	
		List<LoveVO> loveList = new ArrayList<>();
		List<GoodsStep1> goodsList = goodsDAO.selectOrderBy(map);
		List<String> flag = new ArrayList<String>();
		
		if(userid.equals("-1")) {
			loveList = loveDAO.selectLoveUser("1");
		}else {
			loveList = loveDAO.selectLoveUser(userid);
		}
		int a = goodsList.size();
		/*for(int b=0; b<a; b++) {
			System.out.println(">D>D>D>>DD"+goodsList.get(b).toString());
		}*/
		/*for(int i=0; i<goodsList.size(); i++) {
			for(int j=0; j<loveList.size(); j++) {
			if(goodsList.get(i).getGoodsId()==loveList.get(j).getGoods_id()) {
				flag.add("true");
				break;
			}
			}
			if(flag.size()==i)
			flag.add("false");
		}*/
		

		ArrayList<HashMap<String, Object>> mainImage=new ArrayList<HashMap<String,Object>>();
		GoodsStep1 goods = null;
		for(int i=0; i<a; i++) {
			Map<String,Object> dbImage=new HashMap<String, Object>();
			
			List<String> imageList = new ArrayList<String>();
			String name = null;
			int price = 0;
			int goodsid = 0;
			
			
			//System.out.print(goodsList.get(i).getGoodsIndexId());
			
			goods = goodsDAO.selectGoodsIndex(goodsList.get(i).getGoodsIndexId());
			//System.out.print(":D>DDD:D "+goods.toString());
			String[] arr=(((goods.getDbImages().replace("[","")).replace("]","")).split(","));
			if(arr[0] == null || arr[0].isEmpty() || arr[0].equals("null")) {
				continue;
			}else {
				
				for(int j=0; j<arr.length; j++) {
					imageList.add(arr[j]);
					name= goods.getGoodsName();
					price=goods.getGoodsPrice();
					goodsid = goodsList.get(i).getGoodsIndexId();
				}
			}
			goodsList.get(i).setGoodsColor(goodsList.get(i).getDbGoodsColor().replaceAll("\\[", "").replaceAll("\\]", "").trim().split(","));
			String[] colors = goodsList.get(i).getGoodsColor();
			for(int j = 0;j<colors.length;j++) {
			String color= goodsDAO.selectColor(colors[j].trim());
			
			colors[j] = color;
			System.out.println(color);
			}
			goodsList.get(i).setGoodsColor(colors);
			
			dbImage.put("ImageList", imageList);
			dbImage.put("goodsName", name);
			dbImage.put("goodsPrice", price );
			dbImage.put("goodsId", goodsid );
			dbImage.put("colors", colors );
			dbImage.put("goodsBest", goodsList.get(i).getGoodsBest());
			mainImage.add((HashMap<String, Object>) dbImage);
			
		}
		for(int i=0; i<mainImage.size(); i++) {
			System.out.println(mainImage.get(i).get("goodsName"));
		}
		System.out.println(mainImage.toString());
		
		
		List<GoodsSmallType> goodsSmallType = goodsDAO.selectSmallType(goods.getGoodsType());
		
		model.addAttribute("mainImage", mainImage);
 		model.addAttribute("goodsList",goodsList);
 		model.addAttribute("page",page);
 		model.addAttribute("count",count);
 		model.addAttribute("mainCategory", 1);
 		model.addAttribute("orderBy", orderBy);
 		model.addAttribute("goodsType", goods.getGoodsType());
 		model.addAttribute("flag",flag);
 		model.addAttribute("goodsSmallType",goodsSmallType);

 		return "user/goodsCategory";

	}

	
	//상품상세페이지
	@RequestMapping("/detail")
	public String detail(PageVO page,Model model,@RequestParam(required = false, defaultValue = "-1")int goodsId) {
		GoodsStep1 goods = goodsDAO.selectGoodsIndex(goodsId);
		System.out.println(goods.toString());
		
		goods.setGoodsColor(goods.getDbGoodsColor().replaceAll("\\[", "").replaceAll("\\]", "").trim().split(","));
		String[] colors = goods.getGoodsColor();
		for(int j = 0;j<colors.length;j++) {
		String color= colors[j].trim();
		
		colors[j] = color;
		}
		
		goods.setGoodsSize(goods.getDbGoodsSize().replaceAll("\\[", "").replaceAll("\\]", "").trim().split(","));
		String[] sizes = goods.getGoodsSize();
		for(int j = 0;j<sizes.length;j++) {
		String size= sizes[j].trim();
		
		sizes[j] = size;
		}
		model.addAttribute("goods",goods);
		return "goods/detail";
	}
	
}
