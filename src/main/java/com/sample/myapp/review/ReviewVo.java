package com.sample.myapp.review;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import com.sample.myapp.goods.GoodsVo;

import lombok.Data;
@Data
public class ReviewVo {
	private int reviewId;
	private Date regdate;
	private Date updatedate;
	private String reviewTitle;
	private String reviewContents;
	private String reviewAnswer;
	private Integer reviewColor;
	private Integer reviewSize;
	private Integer reviewComf;
	private Integer reviewQual;
	private String userId;
	private Float star;
	private String dbImage;
	private MultipartFile[] image;
	private int goodsIndexId;
	private String[] imageUrls;
	private GoodsVo options;
	private Integer goodsId;
}
