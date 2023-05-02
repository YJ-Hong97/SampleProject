package com.sample.myapp.goods;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
@Data
public class CheckVo {
	private Integer goodsIndexId;
	private int cleaning;
	private int lining;
	private int thickness;
	private int through;
	private int flexibility;
	private int fit;
}
