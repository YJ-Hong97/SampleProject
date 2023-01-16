package com.sample.myapp.listner;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class VisitDao {
	@Autowired
	SqlSession session;
	public VisitVo selectVisit() {
		return session.selectOne("visitMapper.selectVisit");
	}
	public void insertVisit() {
		session.insert("visitMapper.insertVisit");
	}
	public void updateVisit() {
		session.update("visitMapper.updateVisit");
	}

}
