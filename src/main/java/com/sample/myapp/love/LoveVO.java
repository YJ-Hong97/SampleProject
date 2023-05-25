package com.sample.myapp.love;

import java.sql.Date;

import com.sample.myapp.goods.GoodsStep1;
import com.sample.myapp.goods.GoodsVo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Data
public class LoveVO {
	private Integer love_id;
	private String user_id;
	private Integer goods_id;
	private Integer goods_index_id;
	private GoodsVo goods;
	private GoodsStep1 index;
	public LoveVO(int love_id,String user_id, int goods_id) {
		this.love_id = love_id;
		this.user_id = user_id;
		this.goods_id = goods_id;
	}
	public LoveVO() {}
}
