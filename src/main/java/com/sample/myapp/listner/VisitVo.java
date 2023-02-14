package com.sample.myapp.listner;

import java.sql.Date;

public class VisitVo {
	private Date visitDate;
	private int visitCount;
	private String visitIp;
	private String visitAgent;
	private String visitRefer;
	
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
	public String getVisitIp() {
		return visitIp;
	}
	public void setVisitIp(String visitIp) {
		this.visitIp = visitIp;
	}
	public String getVisitAgent() {
		return visitAgent;
	}
	public void setVisitAgent(String visitAgent) {
		this.visitAgent = visitAgent;
	}
	public String getVisitRefer() {
		return visitRefer;
	}
	public void setVisitRefer(String visitRefer) {
		this.visitRefer = visitRefer;
	}
	@Override
	public String toString() {
		return "VisitVo [visitDate=" + visitDate + ", visitCount=" + visitCount + ", visitIp=" + visitIp
				+ ", visitAgent=" + visitAgent + ", visitRefer=" + visitRefer + "]";
	}
	
	
}
