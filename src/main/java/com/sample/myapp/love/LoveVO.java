package com.sample.myapp.love;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@ToString

public class LoveVO {
	private int love_id;
	private String user_id;
	private int goods_id;
	
	
}
