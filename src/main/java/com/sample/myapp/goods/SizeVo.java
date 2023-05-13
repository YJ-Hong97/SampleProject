package com.sample.myapp.goods;

import java.util.List;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
@Data
@Getter
@Setter
public class SizeVo {
	private Integer goodsId;
	private Integer totalLength;
	private Integer shoulder;
	private Integer chest;
	private Integer arm;
	private Integer armSection;
	private Integer armhole;
	private Integer waist;
	private Integer rise;
	private Integer heap;
	private Integer thigh;
	private Integer hem;
	private String sizeName;
	private List<SizeVo> sizeVos;
}
