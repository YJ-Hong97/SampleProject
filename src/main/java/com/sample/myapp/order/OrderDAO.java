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
	
	//아이디별 장바구니 상품 개수
	public int  selectCountByUserId(String userId) {
		return session.selectOne("orderMapper.selectCountByUserId", userId);
	}
	
	//장바구니 상품 선택 삭제
	public int deleteShoppingCart(String userId, String goodsId) {
		Ids id = new Ids(userId, goodsId); 
		return session.delete("orderMapper.deleteShoppingCart",id);
	}
	
	public class Ids {
		String userId;
		String goodsId;
		
		Ids(String userId, String goodsId){
			this.userId = userId;
			this.goodsId = goodsId;
		}
	}
}
