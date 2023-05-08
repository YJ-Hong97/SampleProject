package com.sample.myapp.order;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sample.myapp.S3Service;
import com.sample.myapp.goods.OrderListVo;

@Repository
public class OrderDAO {
	@Autowired
	private SqlSession session;
	@Autowired
	private S3Service s3Service;
	
	//장바구니 상품 리스트
	public List<OrderListVo> selectShoppingCart(String userId) {
		return session.selectList("orderMapper.selectShoppingCart", userId);
	}
	
}
