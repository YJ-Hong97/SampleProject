package com.sample.myapp.goods;


import java.sql.Date;


import lombok.Getter;
import lombok.Setter;
import software.amazon.ion.impl.PrivateByteTransferReader;

@Getter
@Setter
public class GoodsVo {
	private int goodsId;
	private int goodsType;
	private String goodsName;
	private int goodsPrice;
	private String goodsColor;
	private String goodsSize;
	private String goodsOption1;
	private String goodsOption2;
	private String goodsOption3;
	private String dbGoodsImage;
	private String s3GoodsImage;
	private String[] arrayImage;
	private Date goodsDate;
	private String goodsHTML;
	private int goodsSale;
	private int goodsBest;
	private int goodsActive;
	
	public String[] getArrayImage() {
		return arrayImage;
	}
	public void setArrayImage(String[] arrayImage) {
		this.arrayImage = arrayImage;
	}
	public String getS3GoodsImage() {
		return s3GoodsImage;
	}
	public void setS3GoodsImage(String s3GoodsImage) {
		this.s3GoodsImage = s3GoodsImage;
	}
	public String getDbGoodsImage() {
		return dbGoodsImage;
	}
	public void setDbGoodsImage(String dbGoodsImage) {
		this.dbGoodsImage = dbGoodsImage;
	}
	public String getGoodsHTML() {
		return goodsHTML;
	}
	public void setGoodsHTML(String goodsHTML) {
		this.goodsHTML = goodsHTML;
	}
	public String getGoodsColor() {
		return goodsColor;
	}
	public void setGoodsColor(String goodsColor) {
		this.goodsColor = goodsColor;
	}
	public String getGoodsSize() {
		return goodsSize;
	}
	public void setGoodsSize(String goodsSize) {
		this.goodsSize = goodsSize;
	}
	public String getGoodsOption1() {
		return goodsOption1;
	}
	public void setGoodsOption1(String goodsOption1) {
		this.goodsOption1 = goodsOption1;
	}
	public String getGoodsOption2() {
		return goodsOption2;
	}
	public void setGoodsOption2(String goodsOption2) {
		this.goodsOption2 = goodsOption2;
	}
	public String getGoodsOption3() {
		return goodsOption3;
	}
	public void setGoodsOption3(String goodsOption3) {
		this.goodsOption3 = goodsOption3;
	}
	public Date getGoodsDate() {
		return goodsDate;
	}
	public void setGoodsDate(Date goodsDate) {
		this.goodsDate = goodsDate;
	}
	
	public int getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}
	public int getGoodsType() {
		return goodsType;
	}
	public void setGoodsType(int goodsType) {
		this.goodsType = goodsType;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public int getGoodsPrice() {
		return goodsPrice;
	}
	public void setGoodsPrice(int goodsPrice) {
		this.goodsPrice = goodsPrice;
	}
	public int getGoodsSale() {
		return goodsSale;
	}
	public void setGoodsSale(int goodsSale) {
		this.goodsSale = goodsSale;
	}
	public int getGoodsBest() {
		return goodsBest;
	}
	public void setGoodsBest(int goodsBest) {
		this.goodsBest = goodsBest;
	}
	public int getGoodsActive() {
		return goodsActive;
	}
	public void setGoodsActive(int goodsActive) {
		this.goodsActive = goodsActive;
	}
	@Override
	public String toString() {
		return "GoodsVo [goodsId=" + goodsId + ", goodsType=" + goodsType + ", goodsName=" + goodsName + ", goodsPrice="
				+ goodsPrice + ", goodsColor=" + goodsColor + ", goodsSize=" + goodsSize + ", goodsOption1="
				+ goodsOption1 + ", goodsOption2=" + goodsOption2 + ", goodsOption3=" + goodsOption3 + ", dbGoodsImage="
				+ dbGoodsImage + ", goodsDate=" + goodsDate + ", goodsHTML=" + goodsHTML + ", goodsSale=" + goodsSale
				+ ", goodsBest=" + goodsBest + ", goodsActive=" + goodsActive + "]";
	}
	
	
}
