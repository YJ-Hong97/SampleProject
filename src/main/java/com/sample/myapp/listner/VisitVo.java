package com.sample.myapp.listner;

import java.sql.Date;

public class VisitVo {
	private Date visitDate;
	private int visitCount;
	@Override
	public String toString() {
		return "VisitVo [visitDate=" + visitDate + ", visitCount=" + visitCount + "]";
	}
	public Date getVisitDate() {
		return visitDate;
	}
	public void setVisitDate(Date visitDate) {
		this.visitDate = visitDate;
	}
	public int getVisitCount() {
		return visitCount;
	}
	public void setVisitCount(int visitCount) {
		this.visitCount = visitCount;
	}
	
	
}
