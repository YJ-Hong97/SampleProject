package com.sample.myapp.goods;

import java.sql.Date;

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
	private String goodsImage;
	private Date goodsDate;
	
	@Override
	public String toString() {
		return "GoodsVo [goodsId=" + goodsId + ", goodsType=" + goodsType + ", goodsName=" + goodsName + ", goodsPrice="
				+ goodsPrice + ", goodsColor=" + goodsColor + ", goodsSize=" + goodsSize + ", goodsOption1="
				+ goodsOption1 + ", goodsOption2=" + goodsOption2 + ", goodsOption3=" + goodsOption3 + ", goodsImage="
				+ goodsImage + ", goodsDate=" + goodsDate + "]";
	}
	
}
