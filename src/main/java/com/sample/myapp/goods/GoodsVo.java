package com.sample.myapp.goods;

import java.sql.Date;
import java.util.Arrays;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class GoodsVo {
	private String goodsId;
	private String goodsType;
	private String goodsName;
	private int goodsPrice;
	private String goodsColor;
	private String goodsSize;
	private String goodsOption1;
	private String goodsOption2;
	private String goodsOption3;
	private String[] goodsImage;
	private String dbGoodsImage;
	private Date goodsDate;
	
	
	public void setGoodsImage(String[] goodsImage) {
		this.dbGoodsImage = Arrays.toString(goodsImage);
		this.goodsImage = goodsImage;
	}
	
}
