package com.sample.myapp.goods;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

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
	

	public List<GoodsStep1> selectAll(Map<String, Object> map) {
		return session.selectList("goodsMapper.goodsSelectAll", map);
	}

	public int totalCount(Map<String, Object> map) {
		return session.selectOne("goodsMapper.goodsTotal",map);
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

	public void insertGoods(GoodsStep1 goodsVo) throws IOException {
		if(goodsVo.getImageUrls()!=null) {
			updateGoods(goodsVo);
		}else {
			MultipartFile[] images = goodsVo.getGoodsImage();
			String[] strImages = new String[images.length];
			for(int i = 0;i<images.length;i++) {
				MultipartFile file = images[i];
				switch (goodsVo.getGoodsType()) {
				case 0:
					strImages[i] = s3Service.uploadFile(file, "top");
					break;
				case 1:
					strImages[i] =s3Service.uploadFile(file, "shirts");
					break;
				case 2:
					strImages[i] =s3Service.uploadFile(file, "knit");
					break;
				case 3:
					strImages[i] =s3Service.uploadFile(file, "outer");
				case 4:
					strImages[i] =s3Service.uploadFile(file, "bottom");
					break;
				case 5:
					strImages[i] =s3Service.uploadFile(file, "skirt");
					break;
				case 6:
					strImages[i] =s3Service.uploadFile(file, "bag");
					break;
				case 7:
					strImages[i] =s3Service.uploadFile(file, "acc");
					break;
				case 8:
					strImages[i] =s3Service.uploadFile(file, "shoes");
					break;
				
				default:
					break;
				
				}
			}
			goodsVo.setDbImages(Arrays.toString(strImages));		
			goodsVo.setDbGoodsColor(Arrays.toString(goodsVo.getGoodsColor()));
			goodsVo.setDbGoodsSize(Arrays.toString(goodsVo.getGoodsSize()));
			goodsVo.setGoodsHTML("");
			session.insert("goodsMapper.goodsInsert", goodsVo);
		}
		
	}

	private void updateGoods(GoodsStep1 goodsVo) {
		GoodsStep1 beforeGoods = selectGoodsIndex(goodsVo.getGoodsIndexId());
		beforeGoods.setImageUrls(beforeGoods.getDbImages().replaceAll("\\[", "").replaceAll("\\]","").trim().split(","));
		
		for(int i = 0;i<beforeGoods.getImageUrls().length;i++) {
			int count = 0;
			for(int j = 0;j<goodsVo.getImageUrls().length;j++) {
				if(beforeGoods.getImageUrls()[i].equals(goodsVo.getImageUrls()[j])) {
					count++;
				}
			}
			if(count==0) {
				s3Service.deleteFile(beforeGoods.getImageUrls()[i]);
			}
		}
		MultipartFile[] images = goodsVo.getGoodsImage();
		String[] strImages = new String[images.length+goodsVo.getImageUrls().length];
		for(int i = 0;i<images.length;i++) {
			MultipartFile file = images[i];
			switch (goodsVo.getGoodsType()) {
			case 0:
				strImages[i] = s3Service.uploadFile(file, "top");
				break;
			case 1:
				strImages[i] =s3Service.uploadFile(file, "shirts");
				break;
			case 2:
				strImages[i] =s3Service.uploadFile(file, "knit");
				break;
			case 3:
				strImages[i] =s3Service.uploadFile(file, "outer");
			case 4:
				strImages[i] =s3Service.uploadFile(file, "bottom");
				break;
			case 5:
				strImages[i] =s3Service.uploadFile(file, "skirt");
				break;
			case 6:
				strImages[i] =s3Service.uploadFile(file, "bag");
				break;
			case 7:
				strImages[i] =s3Service.uploadFile(file, "acc");
				break;
			case 8:
				strImages[i] =s3Service.uploadFile(file, "shoes");
				break;
			
			default:
				break;
			
			}
		}
		for(int i = goodsVo.getGoodsImage().length;i<goodsVo.getGoodsImage().length+goodsVo.getImageUrls().length;i++) {
			strImages[i] = goodsVo.getImageUrls()[i-goodsVo.getGoodsImage().length];
		}
		goodsVo.setDbImages(Arrays.toString(strImages));		
		goodsVo.setDbGoodsColor(Arrays.toString(goodsVo.getGoodsColor()));
		goodsVo.setDbGoodsSize(Arrays.toString(goodsVo.getGoodsSize()));
		session.insert("goodsMapper.goodsInsert", goodsVo);
	}

	public List<String> selectOption() {
		return session.selectList("goodsMapper.goodsOption");
	}
	public GoodsVo selectGoods(int goodsId) {
		return session.selectOne("goodsMapper.selectOneGoods",goodsId);
	}

	public List<GoodsVo> selectGoodsVo(int goodsIndexId){
		return session.selectList("goodsMapper.selectGoodsVo",goodsIndexId);
	}
	
	public List<GoodsVo> selectOrderBy(Map<String, Object> map) {
		return session.selectList("goodsMapper.goodsSelecOrderBy", map);
	}
	public List<GoodsSmallType> selectSmallType(){
		return session.selectList("goodsMapper.selectSmallType");
	}
	public List<GoodsSmallType> selectSmallTypebyType(int goodsType){
		return session.selectList("goodsMapper.selectSmallTypebyType",goodsType);
	}
	public List<OrderVo> selectOrder(Map<String, Object> map){
		return session.selectList("goodsMapper.selectOrder",map);
	}
	public int selectOrderCount(Map<String,Object> map) {
		return session.selectOne("goodsMapper.selectOrderCount",map);
	}
	/*메인페이지 신규 상품 리스트*/
	public List<GoodsStep1> selectNewGoods(){
		return session.selectList("goodsMapper.selectNewGoods");
	}
	public SizeVo selectSize(int goodsId) {
		return session.selectOne("goodsMapper.selectSize",goodsId);
	}
	public SizeImgVo selectSizeImg() {
		return session.selectOne("goodsMapper.selectSizeImg");
	}
	public CheckVo selectCheck(int goodsId) {
		return session.selectOne("goodsMapper.selectCheck",goodsId);
	}
	public String selectGoodsName(String goodsName) {
		return session.selectOne("goodsMapper.selectGoodsName",goodsName);
	}
	public List<ColorVo> searchColor(String keyword) {
		return session.selectList("goodsMapper.searchColor",keyword);
	}
	public void insertColor(ColorVo color) {
		session.insert("goodsMapper.insertColor",color);
	}
	public List<GoodsSmallType> selectSmallType(int goodsCode){
		return session.selectList("goodsMapper.selectSmallType",goodsCode);
	}
	public Integer selectGoodsIndexId(String goodsName) {
		return session.selectOne("goodsMapper.selectGoodsIndexId",goodsName);
	}
	public GoodsStep1 selectGoodsIndex(int goodsIndexId) {
		return session.selectOne("goodsMapper.selectGoodsIndex",goodsIndexId);
	}
	public void insertGoodsStock(GoodsVo goodsVo) {
		session.insert("goodsMapper.insertGoodsStock",goodsVo);
	}
}
