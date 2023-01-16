package com.sample.myapp.manager;

import java.util.List;

import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sample.myapp.PageVO;
import com.sample.myapp.goods.GoodsDAO;
import com.sample.myapp.goods.GoodsVo;
@RequestMapping("/manager")
@Controller
public class ManagerController {

	@Autowired
	GoodsDAO goodsDAO;
	/*관리자 페이지 이동*/
	@RequestMapping("/")
	public String home() {
		
		return "admin/admin";
	}
	
	/*상품 관리 페이지 이동*/
	@RequestMapping("/goods")
	public String goods(PageVO page,Model model){
		int count = goodsDAO.totalCount();
		page.setPageList(count);
		List<GoodsVo> goodsList = goodsDAO.selectAll(page);
		model.addAttribute("goodsList",goodsList);
		model.addAttribute("page",page);
		model.addAttribute("count",count);
		return "admin/goods";
		
	}
	
}
