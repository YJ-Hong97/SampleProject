package com.sample.myapp.goods;

public class GoodsTypeVo {
	private int goodsCode;
	private String typeName;
	public int getGoodsCode() {
		return goodsCode;
	}
	public void setGoodsCode(int goodsCode) {
		this.goodsCode = goodsCode;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	@Override
	public String toString() {
		return "GoodsTypeVo [goodsCode=" + goodsCode + ", typeName=" + typeName + "]";
	}

}
