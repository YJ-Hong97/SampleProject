package com.sample.myapp.goods;




import java.util.ArrayList;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
@Data
@Getter
@Setter
public class GoodsVo {
	private int goodsId;
	private int goodsIndexId;
	private String goodsColor;
	private String goodsSize;
	private int stock;
	private int goodsType;
	private ArrayList<GoodsVo> goodsList;
	public GoodsVo() {
		
	}
}
