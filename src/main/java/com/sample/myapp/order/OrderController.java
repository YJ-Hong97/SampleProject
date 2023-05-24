package com.sample.myapp.order;

import java.util.ArrayList;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sample.myapp.goods.GoodsDAO;
import com.sample.myapp.goods.GoodsStep1;
import com.sample.myapp.goods.OrderListVo;
import com.sample.myapp.order.OrderDAO.Ids;

@Controller
@RequestMapping(value = "order")
public class OrderController {
	@Autowired
	OrderService orderService;
	@Autowired
	GoodsDAO goodsDAO;
	/* 장바구니 상품 리스트 */
	
	@RequestMapping(value = "/shoppingcart",method = RequestMethod.GET)
	public String shoppingCart( HttpServletRequest request,@RequestParam(required = false, defaultValue = "hyj1077") String userId, Model model) {
		if(userId.isEmpty() || userId.equals("")) {
			userId = "hyj1077";
		}
		List<OrderListVo> goodsList = orderService.selectShoppingCart(userId);

		ArrayList<HashMap<String, Object>> mainImage=new ArrayList<HashMap<String,Object>>();
		GoodsStep1 goods = null;
		for(int i=0; i<goodsList.size(); i++) {
			Map<String,Object> dbImage=new HashMap<String, Object>();
			
			List<String> imageList = new ArrayList<String>();
			String name = null;
			int price = 0;
			int goodsid = 0;
			String detail = null;
			
			System.out.print(goodsList.get(i).getGoodsId());
			if(goodsList.get(i).getGoodsId()>22) {
				continue;
			}
			
			goods = goodsDAO.selectGoodsIndex(goodsList.get(i).getGoodsId());
			System.out.print(":D>DDD:D "+goods.toString());
			String[] arr=(((goods.getDbImages().replace("[","")).replace("]","")).split(","));
			if(arr[0] == null || arr[0].isEmpty() || arr[0].equals("null")) {
				continue;
			}else {
				
				for(int j=0; j<arr.length; j++) {
					imageList.add(arr[j]);
					name= goods.getGoodsName();
					price=goods.getGoodsPrice();
					goodsid = goodsList.get(i).getGoodsId();
					detail = goods.getGoodsDetail();
				}
			}
			
			dbImage.put("ImageList", imageList);
			dbImage.put("goodsName", name);
			dbImage.put("goodsPrice", price );
			dbImage.put("goodsId", goodsid );
			dbImage.put("goodsList", goodsList.get(i) );
			dbImage.put("detail", detail);
			mainImage.add((HashMap<String, Object>) dbImage);
			
		}
		
		int count = orderService.selectCountByUserId(userId);
		
		model.addAttribute("count",count);
		model.addAttribute("mainImage",mainImage);
		return "order/shoppingCart";
	}
	
	@RequestMapping(value = "/deleteShoppingCart" ,method = RequestMethod.POST)	
	@ResponseBody
	public String test(HttpServletRequest request, @RequestParam("goodsId") String goodsId, @RequestParam("userId") String userId) {
		orderService.deleteShoppingCart(userId, goodsId);
		
		System.out.println(goodsId);
	        return "/";
	}
	
}
