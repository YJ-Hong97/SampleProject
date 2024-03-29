package com.sample.myapp.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sample.myapp.goods.OrderListVo;
import com.sample.myapp.order.OrderDAO.Ids;

@Service
public class OrderService {
	
	@Autowired
	OrderDAO orderDAO;
	
	
	public List<OrderListVo> selectShoppingCart(String userId) {
		return orderDAO.selectShoppingCart(userId);
	}
	
	public int selectCountByUserId(String userId) {
		return orderDAO.selectCountByUserId(userId);
	}
	
	public int deleteShoppingCart(String userId, String goodsId) {
		return orderDAO.deleteShoppingCart(userId, goodsId);
	}
}
