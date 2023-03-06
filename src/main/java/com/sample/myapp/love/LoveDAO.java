package com.sample.myapp.love;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoveDAO {
	@Autowired
	SqlSession session;
	public void insertLove(LoveVO love) {
		session.insert("loveMapper.loveInsert",love);
	}
	
	public List<LoveVO> selectLoveAll(LoveVO love) {
		return session.selectList("loveMapper.selectLoveAll",love);
	}
	
	public List<LoveVO> selectLoveUser(String userid) {
		return session.selectList("loveMapper.selectLoveUser",userid);
	}
	
}
