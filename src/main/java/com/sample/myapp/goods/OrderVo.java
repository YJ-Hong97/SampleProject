package com.sample.myapp.goods;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OrderVo {
	private String orderId;
	private String userId;
	private int price;
	private int payment;
	private int delivery;
	private String orderListId;
	private Date pay_date;
	private Date payDate;
	private int orderState;
	private Date orderDate;
	
	@Override
	public String toString() {
		return "OrderVo [orderId=" + orderId + ", userId=" + userId + ", price=" + price + ", payment=" + payment
				+ ", delivery=" + delivery + ", orderListId=" + orderListId + ", pay_date=" + pay_date + ", payDate="
				+ payDate + "]";
	}

}
