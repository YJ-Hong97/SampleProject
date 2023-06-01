package com.sample.myapp.review;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDao {
	@Autowired
	SqlSession session;
	
	public List<ReviewVo> selectReview(int goodsIndexId){
		return session.selectList("reviewMapper.selectReview",goodsIndexId);
	}
	
	public ReviewVo selectMax(int goodsIndexId) {
		return session.selectOne("reviewMapper.selectMax",goodsIndexId);
	}
	public ReviewVo selectSum(int goodsIndexId) {
		return session.selectOne("reviewMapper.selectSum",goodsIndexId);
	}
}
