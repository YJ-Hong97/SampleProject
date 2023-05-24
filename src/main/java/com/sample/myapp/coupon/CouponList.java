package com.sample.myapp.coupon;

import lombok.Data;

@Data
public class CouponList {
	private String userId;
	private int couponId;
	private int amount;
}
