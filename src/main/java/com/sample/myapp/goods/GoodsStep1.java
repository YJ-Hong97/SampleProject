package com.sample.myapp.goods;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;


@Data
public class GoodsStep1 {
	private Integer goodsIndexId;
	private int goodsType;
	private String goodsName;
	private int goodsPrice;
	private String[] goodsColor;
	private String[] goodsSize;
	private MultipartFile[] goodsImage;
	private int goodsSale;
	private int goodsBest;
	private int goodsActive;
	private int goodsSmallType;
	private String goodsDetail;
	private String goodsHTML;
	private Date goodsDate;
	private String dbImages;
	private String dbGoodsColor;
	private String dbGoodsSize;
	private String[] imageUrls;
}
