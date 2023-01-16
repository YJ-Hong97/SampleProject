package com.sample.myapp.test;

public class PageVo {
	private static final int DEFAULT_SIZE=10;
	private int page;
	private int size;
	public PageVo() {
		this.page=1;
		this.size=DEFAULT_SIZE;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	@Override
	public String toString() {
		return "PageVo [page=" + page + ", size=" + size + "]";
	}
	
}
