package com.sample.myapp;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HomeDao {
	@Autowired
	private SqlSession session;
	public List<AdsVo> selectAds(){
		return session.selectList("homeMapper.selectAds");
	}
}
