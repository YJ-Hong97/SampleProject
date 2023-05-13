package com.sample.myapp.manager;

import java.awt.Font;

import java.awt.GraphicsEnvironment;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.sample.myapp.PageVO;
import com.sample.myapp.goods.CheckVo;
import com.sample.myapp.goods.ColorVo;
import com.sample.myapp.goods.EmojiVo;
import com.sample.myapp.goods.GoodsDAO;
import com.sample.myapp.goods.GoodsSmallType;
import com.sample.myapp.goods.GoodsStep1;
import com.sample.myapp.goods.GoodsTypeVo;
import com.sample.myapp.goods.GoodsVo;
import com.sample.myapp.goods.OrderVo;
import com.sample.myapp.goods.SizeImgVo;
import com.sample.myapp.goods.SizeVo;
import com.sample.myapp.listner.VisitDao;
import com.sample.myapp.listner.VisitToday;

@RequestMapping("/manager")
@Controller
public class ManagerController {

	@Autowired
	GoodsDAO goodsDAO;
	@Autowired
	VisitDao visitDao;

	/* 관리자 페이지 이동 */
	@RequestMapping("/")
	public String home() {

		return "admin/admin";
	}

	/* 상품 관리 페이지 이동 */
	@RequestMapping("/goods")
	public String goods(PageVO page, Model model, Integer goodsType, String searchKeyword) {

		Map<String, Object> map = new HashMap<>();
		map.put("goodsType", goodsType);
		map.put("searchKeyword", searchKeyword);

		int count = goodsDAO.totalCount(map);
		System.out.println(count+"}}}}}}}}}}}");
		page.setPageList(count);

		map.put("start", page.getStart());
		map.put("size", page.getSize());

		List<GoodsStep1> goodsList = goodsDAO.selectAll(map);

		List<GoodsTypeVo> typeList = goodsDAO.selectAllType();

		model.addAttribute("typeList", typeList);
		model.addAttribute("goodsList", goodsList);
		model.addAttribute("page", page);
		model.addAttribute("count", count);
		return "admin/goods";

	}

	/* 상품 등록 페이지 이동 */
	@RequestMapping(value = "/goods/insert", method = RequestMethod.GET)
	public String insertGoods(Model model, Integer goodsId) {
		List<GoodsTypeVo> typeList = goodsDAO.selectAllType();
		List<GoodsSmallType> smallTypes = goodsDAO.selectSmallType();

		if (goodsId != null) {
			GoodsStep1 goods = goodsDAO.selectGoodsIndex(goodsId);
			goods.setGoodsColor(goods.getDbGoodsColor().replaceAll("\\[", "").replaceAll("\\]", "").trim().split(","));
			goods.setGoodsSize(goods.getDbGoodsSize().replaceAll("\\[", "").replaceAll("\\]", "").trim().split(","));
			goods.setImageUrls(goods.getDbImages().replaceAll("\\[", "").replaceAll("\\]", "").trim().split(","));
			model.addAttribute("goods", goods);
			CheckVo check = goodsDAO.selectCheck(goodsId);
			model.addAttribute("check",check);
			List<SizeVo> sizes = goodsDAO.selectSizeList(goodsId);
			model.addAttribute("sizes",sizes);
			System.out.println(sizes);
		}

		model.addAttribute("smallTypes", smallTypes);
		model.addAttribute("typeList", typeList);
		return "admin/newInsert";
	}

	@ResponseBody
	@RequestMapping("/goods/checkName")
	public String checkName(String goodsName) {
		String name = goodsDAO.selectGoodsName(goodsName);
		if (name != null) {
			return "fail";
		} else {
			return "success";
		}
	}

	@ResponseBody
	@RequestMapping("/goods/searchColor")
	public List<ColorVo> searchColor(String keyword) {
		return goodsDAO.searchColor(keyword);
	}

	@ResponseBody
	@RequestMapping("/goods/insertColor")
	public void insertColor(String colorName, String colorCode) {
		ColorVo colorVo = new ColorVo();
		colorVo.setColorCode(colorCode);
		colorVo.setColorName(colorName);
		goodsDAO.insertColor(colorVo);
	}

	/* 상품 입력 1단계 */
	@ResponseBody
	@RequestMapping(value = "/goods/insertGoods", method = RequestMethod.POST)
	public List<GoodsVo> insertGoodsStep1(GoodsStep1 goods,CheckVo checkVo,SizeVo sizeVo) throws IOException {
		System.out.println(goods);
		System.out.println(checkVo);
		System.out.println(sizeVo);
		Integer goodsIndexId = goods.getGoodsIndexId();
		if(goods.getGoodsIndexId()==null) {
			goodsDAO.insertGoods(goods);
			goodsIndexId = goodsDAO.selectGoodsIndexId(goods.getGoodsName());
			for(int i =0;i<sizeVo.getSizeVos().size();i++) {
				sizeVo.getSizeVos().get(i).setGoodsId(goodsIndexId);
				goodsDAO.insertDetailSize(sizeVo.getSizeVos().get(i));
				System.out.println(sizeVo);
			}
			checkVo.setGoodsIndexId(goodsIndexId);
			goodsDAO.insertCheck(checkVo);
		}else {
			goodsDAO.insertGoods(goods);
			goodsIndexId = goods.getGoodsIndexId();
			for(int i =0;i<sizeVo.getSizeVos().size();i++) {
				sizeVo.getSizeVos().get(i).setGoodsId(goodsIndexId);
				goodsDAO.updateSize(sizeVo.getSizeVos().get(i));
				System.out.println(sizeVo);
			}
			checkVo.setGoodsIndexId(goodsIndexId);
			goodsDAO.updateCheck(checkVo);
			
		}
		List<GoodsVo> goodsList = goodsDAO.selectGoodsVo(goodsIndexId);
		if (goodsList == null || goodsList.size() == 0) {
			goodsList = new ArrayList<>();
			for (int i = 0; i < goods.getGoodsColor().length; i++) {
				for (int j = 0; j < goods.getGoodsSize().length; j++) {
					GoodsVo goodsVo = new GoodsVo();
					goodsVo.setGoodsColor(goods.getGoodsColor()[i]);
					goodsVo.setGoodsSize(goods.getGoodsSize()[j]);
					goodsVo.setGoodsIndexId(goodsIndexId);
					
					goodsList.add(goodsVo);
					
				}
			}
		}
		

		return goodsList;
	}

	/* 상품 입력 2단계 */
	@RequestMapping("/goods/insertGoodsStep2")
	public String insertGoodsStep2(GoodsVo goods, Model model) {
		System.out.println(goods);
		GoodsStep1 index = goodsDAO.selectGoodsIndex(goods.getGoodsList().get(0).getGoodsIndexId());
		model.addAttribute("index", index);
		model.addAttribute("goodsList", goods.getGoodsList());
		return "/admin/newInsert2";
	}

	/* 상품 저장 최종 */
	@RequestMapping("/goods/saveGoods")
	public String saveGoods(GoodsVo goods) {
		ArrayList<GoodsVo> goodsList = goods.getGoodsList();
		for (int i = 0; i < goodsList.size(); i++) {
			GoodsVo goodsVo = goodsList.get(i);
			goodsDAO.insertGoodsStock(goodsVo);
		}
		return "redirect:/manager/goods";
	}

	/* 소분류 가져오기 */
	@ResponseBody
	@RequestMapping("/smallType")
	public List<GoodsSmallType> goodsSmallType(int goodsCode) {
		List<GoodsSmallType> smallTypes = goodsDAO.selectSmallType(goodsCode);
		return smallTypes;
	}

	/* 주문 페이지로 이동 */
	@RequestMapping("/order")
	public String order(Model model, Integer payment, Integer delivery, Integer orderState, Date start, Date end,
			String month, PageVO pageVO) {

		Map<String, Object> map = new HashMap<>();
		map.put("payment", payment);
		map.put("delivery", delivery);
		map.put("orderState", orderState);
		map.put("start", start);
		map.put("end", end);
		map.put("month", month);

		int count = goodsDAO.selectOrderCount(map);
		pageVO.setPageList(count);
		pageVO.setSize(10);
		map.put("limit", pageVO.getSize());
		map.put("offset", pageVO.getStart());

		List<OrderVo> orders = goodsDAO.selectOrder(map);

		model.addAttribute("count", count);
		model.addAttribute("page", pageVO);
		model.addAttribute("orders", orders);
		return "/admin/order";
	}

	/* 방문자 페이지로 이동 */
	@RequestMapping("/visit")
	public String visit(Model model) {
		Map<String, Integer> map = visitDao.today();
		Map<Date, Integer> total = visitDao.selectVisitAll();
		int max = 0;
		for (Date key : total.keySet()) {
			if (max < total.get(key)) {
				max = total.get(key);
			}
		}

		model.addAttribute("max", max);
		model.addAttribute("today", map);
		model.addAttribute("total", total);
		return "/admin/visit";
	}

}
