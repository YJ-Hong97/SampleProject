package com.sample.myapp.goods;


import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
@RequestMapping("/goods")
@Controller
public class GoodsController {
	@Autowired
	private GoodsDAO goodsDAO;
	

	/*상품 상세 페이지 이동*/
	@RequestMapping("/detail")
	public String goodsDetail(int goodsId,Model model) {
		GoodsStep1 index = goodsDAO.selectGoodsIndex(goodsId);
		index.setImageUrls(index.getDbImages().replaceAll("\\[", "").replaceAll("\\]", "").trim().split(","));
		index.setGoodsColor(index.getDbGoodsColor().replaceAll("\\[", "").replaceAll("\\]", "").trim().split(","));
		index.setGoodsSize(index.getDbGoodsSize().replaceAll("\\[", "").replaceAll("\\]", "").trim().split(","));
		model.addAttribute("goods",index);
		return "goods/detail";
	}
}
