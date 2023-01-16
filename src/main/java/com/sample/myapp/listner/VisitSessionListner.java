package com.sample.myapp.listner;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.beans.factory.annotation.Autowired;


public class VisitSessionListner implements HttpSessionListener{
	@Autowired
	VisitDao visitDao;
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		if(se.getSession().isNew()) {
			execute(se);
		}
	}

	private void execute(HttpSessionEvent se) {
		// TODO Auto-generated method stub
		if(visitDao.selectVisit()==null) {
			visitDao.insertVisit();
		}else {
			visitDao.updateVisit();
		}
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		// TODO Auto-generated method stub
		
	}

	
}
