package com.sample.myapp.goods;



import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sample.myapp.user.UserVo;

@RequestMapping("/goods")
@Controller
public class GoodsController {
	@Autowired
	private GoodsDAO goodsDAO;

	/* 상품 상세 페이지 이동 */
	@RequestMapping("/detail")
	public String goodsDetail(int goodsId, Model model,HttpSession session) {
		GoodsStep1 index = goodsDAO.selectGoodsIndex(goodsId);
		index.setImageUrls(index.getDbImages().replaceAll("\\[", "").replaceAll("\\]", "").trim().split(","));
		index.setGoodsColor(index.getDbGoodsColor().replaceAll("\\[", "").replaceAll("\\]", "").trim().split(","));
		index.setGoodsSize(index.getDbGoodsSize().replaceAll("\\[", "").replaceAll("\\]", "").trim().split(","));
		CheckVo check = goodsDAO.selectCheck(index.getGoodsIndexId());
		List<SizeVo> sizeVos = goodsDAO.selectSizeList(index.getGoodsIndexId());
		SizeImgVo sizeImgVo = goodsDAO.selectSizeImg();
		List<GoodsVo> goodsList = goodsDAO.selectGoodsVo(goodsId);
		
		UserVo user = (UserVo)session.getAttribute("user");
		
		model.addAttribute("user",user);
		model.addAttribute("goodsList",goodsList);
		model.addAttribute("sizeImg",sizeImgVo);
		model.addAttribute("sizes",sizeVos);
		model.addAttribute("check",check);
		model.addAttribute("goods", index);
		return "goods/detail";
	}
	
}
