package com.sample.myapp.goods;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
@RequestMapping("/goods")
@Controller
public class GoodsController {
	@Autowired
	private GoodsDAO goodsDAO;
	@RequestMapping("/detail")
	public String detail(Model model,int goodsId) {
		GoodsVo goodsVo = goodsDAO.selectGoods(goodsId);
		goodsVo.setArrayImage(goodsVo.getDbGoodsImage().replaceAll("\\[", "").replaceAll("\\]", "").trim().split(","));
		String[] colors = goodsVo.getGoodsColor().split(",");
		String[] sizes = goodsVo.getGoodsSize().split(",");
		List<String> colorList = new ArrayList<>();
		List<String> sizeList = new ArrayList<>();
		for(int i = 0;i<colors.length;i++) {
			colorList.add(colors[i]);
		}
		for(int j = 0;j<sizes.length;j++) {
			sizeList.add(sizes[j]);
		}
		
		SizeVo sizeVo = goodsDAO.selectSize(goodsId);
		SizeImgVo sizeImgVo = goodsDAO.selectSizeImg();
		CheckVo checkVo = goodsDAO.selectCheck(goodsId);

		model.addAttribute("check",checkVo);
		model.addAttribute("size",sizeVo);
		model.addAttribute("sizeImg",sizeImgVo);
		model.addAttribute("sizes",sizeList);
		model.addAttribute("colors",colorList);
		model.addAttribute("goods",goodsVo);
		return "/goods/detail";
	}
}
