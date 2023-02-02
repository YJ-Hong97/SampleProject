package com.sample.myapp.goods;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.sample.myapp.PageVO;
import com.sample.myapp.S3Service;

@Repository
public class GoodsDAO {
	@Autowired
	private SqlSession session;
	@Autowired
	private S3Service s3Service;

	public List<GoodsVo> selectAll(PageVO page) {
		return session.selectList("goodsMapper.goodsSelectAll", page);
	}

	public int totalCount() {
		return session.selectOne("goodsMapper.goodsTotal");
	}

	public List<GoodsTypeVo> selectAllType() {
		return session.selectList("goodsMapper.goodsTypeSelectAll");
	}

	public List<EmojiVo> selectAllEmojis(PageVO page) {
		return session.selectList("goodsMapper.emojisSelectAll", page);
	}

	public Integer countEmojis() {
		return session.selectOne("goodsMapper.emojisCount");
	}

	public void insertGoods(GoodsVo goodsVo, HttpServletRequest request) throws IOException {
		
			
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		List<MultipartFile> list = multipartHttpServletRequest.getFiles("image");
		
		String[] dbimageStrings = new String[multipartHttpServletRequest.getFiles("image").size()];
				
		MultipartFile multipartFile = null;
		
		for(int i = 0; i<list.size(); i++) {
			multipartFile = list.get(i);
				switch (goodsVo.getGoodsType()) {
				case 0:
					dbimageStrings[i]=s3Service.uploadFile(multipartFile, "top");
					break;
				case 1:
					dbimageStrings[i]=s3Service.uploadFile(multipartFile, "top");
					break;
				case 2:
					dbimageStrings[i]=s3Service.uploadFile(multipartFile, "top");
					break;
				case 3:
					dbimageStrings[i]=s3Service.uploadFile(multipartFile, "top");
					break;
				case 4:
					dbimageStrings[i]=s3Service.uploadFile(multipartFile, "top");
					break;
				case 5:
					dbimageStrings[i]=s3Service.uploadFile(multipartFile, "top");
					break;
				case 6:
					dbimageStrings[i]=s3Service.uploadFile(multipartFile, "top");
					break;
				case 7:
					dbimageStrings[i]=s3Service.uploadFile(multipartFile, "top");
					break;
				
				default:
					break;
				
			}
		}
		
		goodsVo.setDbGoodsImage(Arrays.toString(dbimageStrings));
		session.insert("goodsMapper.goodsInsert", goodsVo);
	}

	public List<String> selectOption() {
		return session.selectList("goodsMapper.goodsOption");
	}
	public GoodsVo selectGoods(int goodsId) {
		return session.selectOne("goodsMapper.selectOneGoods",goodsId);
	}
	
	public List<GoodsVo> selectOrderBy_price_down(PageVO page) {
		
		return session.selectList("goodsMapper.goodsSelectOrderby_price_down", page);
	}
	public List<GoodsVo> selectOrderBy_price_up(PageVO page) {
		
		return session.selectList("goodsMapper.goodsSelectOrderby_price_up", page);
	}
	public List<GoodsVo> selectOrderBy_date(PageVO page) {
	
	return session.selectList("goodsMapper.goodsSelectOrderby_date_new", page);
	}
	public List<GoodsVo> selectOrderBy_best(PageVO page) {
	
	return session.selectList("goodsMapper.goodsSelectOrderby_best", page);
	}
}
