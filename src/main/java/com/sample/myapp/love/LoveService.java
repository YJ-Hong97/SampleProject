package com.sample.myapp.love;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoveService {
	
	@Autowired
	LoveDAO loveDAO;
	public void insertLove(LoveVO love) {
		loveDAO.insertLove(love);
	}
	
	public List<LoveVO> selectLoveAll(LoveVO love) {
		return loveDAO.selectLoveAll(love);
	}
	
	public List<LoveVO> selectLoveUser(String userid) {
		return loveDAO.selectLoveUser(userid);
	}
}
