package com.sample.myapp;

import java.awt.print.Pageable;
import java.util.Arrays;

import org.apache.tools.ant.types.resources.Sort;

public class PageVO {
	// 페이징 처리를 위한 bean 생성.

	private static final int DEFAULT_SIZE = 10;
	private static final int DEFAULT_MAX_SIZE = 50;

	private int page;
	private int size;
	//size는 게시물 개수. 한 화면에 몇 개의 페이지를 보여줄 것인지를 담당.
	private int start;

	private String keyword;
	private String type;
	private int[] pageList;

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public PageVO() {
		super();
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page=page;
	}
	// 최소값 한정. 3항 연산자
	// 최소값이 0보다 작아진다면, 1을 유지. 최소값은 항상 1

	public int getSize() {
		return this.size = size < DEFAULT_SIZE || size > DEFAULT_MAX_SIZE ? DEFAULT_SIZE : size;
	}

	public void setSize(int size) {
		this.size = size < DEFAULT_SIZE || size > DEFAULT_MAX_SIZE ? DEFAULT_SIZE : size;
	}//size는 기본 사이즈보다 작거나 기본 최대사이즈보다 크다면 기본 사이즈를 유지하고
	//그렇지 않다면 현재 사이즈 유지.
	public int getStart() {
		return this.page*this.size;
	}
	public void setStart() {
		this.start = this.page*this.size;
	}
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public static int getDefaultSize() {
		return DEFAULT_SIZE;
	}

	public static int getDefaultMaxSize() {
		return DEFAULT_MAX_SIZE;
	}
	public int[] getPageList() {
		return this.pageList;
	}
	public void setPageList(int count) {
		int[] pageList =null;
		size = getSize();
		int fakeCount = count/size+1;
		if(fakeCount>5) {
			if(page>fakeCount) {
				pageList = new int[count%5];
				for(int i = 0; i<pageList.length;i++) {
					pageList[i] = i+1;
				}
			}else {
				pageList = new int[5];
				for(int i = 0;i<5;i++) {
					pageList[i] = i+1;
				}
			}
		}else {
			pageList = new int[fakeCount];
			for(int i = 0;i<pageList.length;i++) {
				pageList[i] = i+1;
			}
		}
		
		this.pageList=pageList;
	}

	@Override
	public String toString() {
		return "PageVO [page=" + page + ", size=" + size + ", start=" + start + ", keyword=" + keyword + ", type="
				+ type + ", pageList=" + Arrays.toString(pageList) + "]";
	}
	
}

