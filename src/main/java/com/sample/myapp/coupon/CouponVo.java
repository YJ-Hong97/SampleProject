package com.sample.myapp.coupon;

import java.sql.Date;

import lombok.Data;
@Data
public class CouponVo {
	private int couponId;
	private String couponName;
	private int discountRate;
	private int discountAmount;
	private Date dday;
	private int boundary;
}
