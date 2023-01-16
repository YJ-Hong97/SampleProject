package com.sample.myapp.goods;

import java.sql.Date;

public class OrderListVo {
	private String orderListId;
	private String goodsId;
	private int goodsCount;
	private int price;
	private String goodsSize;
	private String color;
	private String option;
	private String userId;
	private Date orderDate;
	
	
	@Override
	public String toString() {
		return "OrderListVo [orderListId=" + orderListId + ", goodsId=" + goodsId + ", goodsCount=" + goodsCount
				+ ", price=" + price + ", goodsSize=" + goodsSize + ", color=" + color + ", option=" + option
				+ ", userId=" + userId + ", orderDate=" + orderDate + "]";
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public String getOrderListId() {
		return orderListId;
	}
	public void setOrderListId(String orderListId) {
		this.orderListId = orderListId;
	}
	public String getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}
	public int getGoodsCount() {
		return goodsCount;
	}
	public void setGoodsCount(int goodsCount) {
		this.goodsCount = goodsCount;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getGoodsSize() {
		return goodsSize;
	}
	public void setGoodsSize(String goodsSize) {
		this.goodsSize = goodsSize;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getOption() {
		return option;
	}
	public void setOption(String option) {
		this.option = option;
	}
}
