package com.sample.myapp.goods;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.amazonaws.services.s3.model.PublicAccessBlockConfiguration;
import com.sample.myapp.review.ReviewDao;
import com.sample.myapp.review.ReviewVo;
import com.sample.myapp.user.UserVo;

@RequestMapping("/goods")
@Controller
public class GoodsController {
	@Autowired
	private GoodsDAO goodsDAO;
	@Autowired
	private ReviewDao reviewDao;

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
		
		/*리뷰*/
		List<ReviewVo> reviewList = reviewDao.selectReview(goodsId);
		int reviewCount = reviewList.size();
		int fiveCount = 0;
		int fourCount = 0;
		int threeCount = 0;
		int twoCount = 0;
		int oneCount =0;
		int zeroCount = 0;
		int textReview = 0;
		for(int i = 0;i<reviewList.size();i++) {
			if(reviewList.get(i).getDbImage()!=null) {
				reviewList.get(i).setImageUrls(reviewList.get(i).getDbImage().replaceAll("\\[","").replaceAll("\\]", "").split(","));
			}else {
				textReview++;
			}
			if(reviewList.get(i).getGoodsId()!=null) {
				GoodsVo goodsVo = goodsDAO.selectGoods(reviewList.get(i).getGoodsId());
				reviewList.get(i).setOptions(goodsVo);
			}
			if(reviewList.get(i).getStar()!=null) {
			if(reviewList.get(i).getStar()>4) {
				fiveCount++;
			}else if(reviewList.get(i).getStar()>3) {
				fourCount++;
			}else if(reviewList.get(i).getStar()>2) {
				threeCount++;
			}else if(reviewList.get(i).getStar()>1) {
				twoCount++;
			}else if(reviewList.get(i).getStar()>0) {
				oneCount++;
			}else {
				zeroCount++;
			}
			}
		}
		Map<String, Integer> starMap = new HashMap<>();
		starMap.put("five", fiveCount);
		starMap.put("four", fourCount);
		starMap.put("three", threeCount);
		starMap.put("two", twoCount);
		starMap.put("one", oneCount);
		starMap.put("zero", zeroCount);
		
		int top = Math.max(fiveCount,Math.max(fourCount, Math.max(threeCount,Math.max(twoCount, Math.max(oneCount, zeroCount)))));
		
		ReviewVo maxReview = reviewDao.selectMax(goodsId);
		ReviewVo sumReview = reviewDao.selectSum(goodsId);
		
		
		model.addAttribute("textReview",textReview);
		model.addAttribute("sumReview",sumReview);
		model.addAttribute("maxReview",maxReview);
		model.addAttribute("top",top);
		model.addAttribute("starMap",starMap);
		model.addAttribute("reviewCount",reviewCount);
		model.addAttribute("reviewList",reviewList);
		model.addAttribute("user",user);
		model.addAttribute("goodsList",goodsList);
		model.addAttribute("sizeImg",sizeImgVo);
		model.addAttribute("sizes",sizeVos);
		model.addAttribute("check",check);
		model.addAttribute("goods", index);
		return "goods/detail";
	}
	
}
