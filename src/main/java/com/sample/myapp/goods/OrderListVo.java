package com.sample.myapp.goods;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Data
public class OrderListVo {
	private String orderListId;
	private int goodsId;
	private int goodsCount;
	private int price;
	private String goodsSize;
	private String color;
	private String goodsOption;
	private String userId;
	private Date orderDate;
	private int exchange;
	private int refund;
	private int cancel;

}
