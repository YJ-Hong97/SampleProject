package com.sample.myapp.goods;

import java.sql.Date;

public class OrderVo {
	private String orderId;
	private String userId;
	private int price;
	private int payment;
	private int delivery;
	private String orderListId;
	private Date pay_date;
	
	@Override
	public String toString() {
		return "OrderVo [orderId=" + orderId + ", userId=" + userId + ", price=" + price + ", payment=" + payment
				+ ", delivery=" + delivery + ", orderListId=" + orderListId + ", pay_date=" + pay_date + ", payDate="
				+ payDate + "]";
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getPayment() {
		return payment;
	}
	public void setPayment(int payment) {
		this.payment = payment;
	}
	public int getDelivery() {
		return delivery;
	}
	public void setDelivery(int delivery) {
		this.delivery = delivery;
	}
	public String getOrderListId() {
		return orderListId;
	}
	public void setOrderListId(String orderListId) {
		this.orderListId = orderListId;
	}
	public Date getPayDate() {
		return payDate;
	}
	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}
	private Date payDate;
}
