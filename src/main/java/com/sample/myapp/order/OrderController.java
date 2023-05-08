package com.sample.myapp.order;

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

import com.sample.myapp.goods.GoodsStep1;
import com.sample.myapp.goods.OrderListVo;

@Controller
@RequestMapping(value = "order")
public class OrderController {
	@Autowired
	OrderService orderService;

	/* 장바구니 상품 리스트 */
	
	@RequestMapping(value = "/shoppingcart",method = RequestMethod.GET)
	public String shoppingCart( HttpServletRequest request,@RequestParam(required = false, defaultValue = "hyj1077") String userId, Model model) {
		
		List<OrderListVo> goodsList = orderService.selectShoppingCart(userId);
		model.addAttribute("goodsList",goodsList);
		System.out.print(goodsList);
		return "order/shoppingCart";
	}
	
	
	
}
