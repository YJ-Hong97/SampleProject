package com.sample.myapp.coupon;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class CouponDao {
 @Autowired 
 SqlSession session;
 public List<CouponList> selectCouponList(String userId){
	 return session.selectList("couponMapper.selectCouponList",userId);
 }
public CouponVo selectCoupon(int couponId) {
	// TODO Auto-generated method stub
	return session.selectOne("couponMapper.selectCoupon",couponId);
} 
}
