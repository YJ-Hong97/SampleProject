package com.sample.myapp.goods;

import java.sql.Date;


import lombok.Data;



@Data


public class OrderVo {
	private String orderId;
	private String userId;
	private int price;
	private int payment;
	private int delivery;
	private String orderListId;
	private Date payDate;
	private int orderState;
	private Date orderDate;


}
