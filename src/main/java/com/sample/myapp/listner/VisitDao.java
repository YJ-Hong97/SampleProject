package com.sample.myapp.listner;

import java.sql.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.expression.MapAccessor;
import org.springframework.stereotype.Repository;
import org.springframework.web.context.WebApplicationContext;
@Repository
public class VisitDao {
	@Autowired
	private SqlSession session;
	public VisitDao(WebApplicationContext wac) {
		this.session = (SqlSession)wac.getBean("sqlSession");
	}
	public VisitDao() {
		super();
	}
	public VisitVo selectVisit() {
		return session.selectOne("visitMapper.selectVisit");
	}
	public void insertVisit(VisitVo visit) {
		session.insert("visitMapper.insertVisit",visit);
	}
	public void updateVisit() {
		session.update("visitMapper.updateVisit");
	}
	public Map<String, Integer> today() {
		Map<String, Integer> map = new HashMap<>();
		long miliseconds = System.currentTimeMillis();
	    Date today = new Date(miliseconds);
	    Date yesterday = Date.valueOf(today.toLocalDate().minusDays(1));

		map.put("today", session.selectOne("visitMapper.selectToday",today));
		map.put("yesterday", session.selectOne("visitMapper.selectYesterday",yesterday));
		map.put("total", session.selectOne("visitMapper.selectTotal"));
		return map;
	}
	public Map<Date, Integer> selectVisitAll(){
		List<VisitVo> visits = session.selectList("visitMapper.selectVisitAll");
		Map<Date, Integer> map = new LinkedHashMap<>(); 
	
		long miliseconds = System.currentTimeMillis();
	    Date today = new Date(miliseconds);
	    Date minDate = Date.valueOf(today.toLocalDate().minusDays(31));
	    for(Date d = minDate;d.compareTo(today)<0;d=Date.valueOf(d.toLocalDate().plusDays(1))) {
	    	int count=0;
	    	for(int i = 0; i<visits.size(); i++) {
	    		
	    		if(visits.get(i).getVisitDate().equals(d)) {
	    			count++;
	    		}
	    		map.put(d, count);
	    	}
	    }
	    return map;
	}
}
