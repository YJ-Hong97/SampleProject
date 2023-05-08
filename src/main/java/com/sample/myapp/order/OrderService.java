package com.sample.myapp.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sample.myapp.goods.OrderListVo;

@Service
public class OrderService {
	
	@Autowired
	OrderDAO orderDAO;
	
	public List<OrderListVo> selectShoppingCart(String userId) {
		return orderDAO.selectShoppingCart(userId);
	}
}
