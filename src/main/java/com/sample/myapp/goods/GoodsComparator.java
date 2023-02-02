package com.sample.myapp.goods;

import java.util.Comparator;

public class GoodsComparator implements Comparator<GoodsVo>{

public String order_by;
	
	@Override
	public int compare(GoodsVo o1, GoodsVo o2) {
		if(order_by.equals("goods_date")) {
			if(o1.getGoodsDate().before(o2.getGoodsDate())) {
				System.out.println("$$$$$$$$o1 = "+o1.getGoodsDate());
				System.out.println("$$$$$$$$o2 = "+o2.getGoodsDate());
				System.out.println("^^^^^^"+o1.getGoodsDate().before(o2.getGoodsDate()));
				System.out.println("^^^^^^"+o1.getGoodsDate().after(o2.getGoodsDate()));

				return 1;
			}return -1;
		}else if(order_by.equals("goods_best")){
			if(o1.getGoodsBest() < o2.getGoodsBest()) {
				return 1;
			}return -1;
		}else if(order_by.equals("goods_price_down")){
			if(o1.getGoodsPrice() < o2.getGoodsPrice()) {
				return -1;
			}return 1;
		}else if(order_by.equals("goods_price_up")){
			if(o1.getGoodsPrice() < o2.getGoodsPrice()) {
				return 1;
			}return -1;
		}
		return -1;
	}
}
