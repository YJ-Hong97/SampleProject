package com.sample.myapp.goods;

public class GoodsSmallType {
	private int goodsCode;
	private int goodsSmallCode;
	private String typeName;

	public int getGoodsCode() {
		return goodsCode;
	}

	public void setGoodsCode(int goodsCode) {
		this.goodsCode = goodsCode;
	}

	public int getGoodsSmallCode() {
		return goodsSmallCode;
	}

	public void setGoodsSmallCode(int goodsSmallCode) {
		this.goodsSmallCode = goodsSmallCode;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	@Override
	public String toString() {
		return "GoodsSmallType [goodsCode=" + goodsCode + ", goodsSmallCode=" + goodsSmallCode + ", typeName="
				+ typeName + "]";
	}
}
