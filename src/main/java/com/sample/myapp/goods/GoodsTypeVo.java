package com.sample.myapp.goods;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class GoodsTypeVo {
	private int goodsCode;
	private String typeName;
	
	
	@Override
	public String toString() {
		return "GoodsTypeVo [goodsCode=" + goodsCode + ", typeName=" + typeName + "]";
	}

}
