package com.sample.myapp.goods;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
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
	
}
