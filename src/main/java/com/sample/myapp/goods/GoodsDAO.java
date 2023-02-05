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
	

	public List<GoodsVo> selectAll(Map<String, Object> map) {
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

	public void insertGoods(GoodsVo goodsVo, HttpServletRequest request) throws IOException {
		
			
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		List<MultipartFile> list = multipartHttpServletRequest.getFiles("image");
		
		
		List<String> dbimageStrings = new ArrayList<>();
		List<String> s3GoodsImages = new ArrayList<>();
		List<String> remainImages = null;
		List<String> remainS3 = null;
		if(goodsVo.getDbGoodsImage()!=null) {
			remainImages =Arrays.asList(goodsVo.getDbGoodsImage().replaceAll("\\[", "").replaceAll("\\]","").trim().split(","));
			remainS3 = Arrays.asList(goodsVo.getS3GoodsImage().replaceAll("\\[", "").replaceAll("\\]", "").trim().split(","));
		}
		
				
		MultipartFile multipartFile = null;
		
		for(int i = 0; i<list.size(); i++) {
			multipartFile = list.get(i);
			System.out.println(multipartFile.getOriginalFilename());
				switch (goodsVo.getGoodsType()) {
				case 0:
					dbimageStrings.add(s3Service.uploadFile(multipartFile, "top"));
					s3GoodsImages.add("top/"+multipartFile.getOriginalFilename());
					
					break;
				case 1:
					dbimageStrings.add(s3Service.uploadFile(multipartFile, "knit"));
					s3GoodsImages.add("knit/"+multipartFile.getOriginalFilename());
					break;
				case 2:
					dbimageStrings.add(s3Service.uploadFile(multipartFile, "shirt"));
					s3GoodsImages.add("shirt/"+multipartFile.getOriginalFilename());
					break;
				case 3:
					dbimageStrings.add(s3Service.uploadFile(multipartFile, "bottom"));
					s3GoodsImages.add("bottom/"+multipartFile.getOriginalFilename());
					break;
				case 4:
					dbimageStrings.add(s3Service.uploadFile(multipartFile, "skirt"));
					s3GoodsImages.add( "skirt/"+multipartFile.getOriginalFilename());
					break;
				case 5:
					dbimageStrings.add(s3Service.uploadFile(multipartFile, "bag"));
					s3GoodsImages.add("bag/"+multipartFile.getOriginalFilename());
					break;
				case 6:
					dbimageStrings.add(s3Service.uploadFile(multipartFile, "shoes"));
					s3GoodsImages.add("shoes/"+multipartFile.getOriginalFilename());
					break;
				case 7:
					dbimageStrings.add(s3Service.uploadFile(multipartFile, "acc"));
					s3GoodsImages.add("acc/"+multipartFile.getOriginalFilename());
					break;
				
				default:
					break;
				
			}
		}
		if(remainImages!=null) {
			for(int i = 0; i<remainImages.size();i++) {
				dbimageStrings.add(remainImages.get(i));
				s3GoodsImages.add(remainS3.get(i));
			}
		}

		goodsVo.setDbGoodsImage(dbimageStrings.toString());
		goodsVo.setS3GoodsImage(s3GoodsImages.toString());
		session.insert("goodsMapper.goodsInsert", goodsVo);
	}

	public List<String> selectOption() {
		return session.selectList("goodsMapper.goodsOption");
	}
	public GoodsVo selectGoods(int goodsId) {
		return session.selectOne("goodsMapper.selectOneGoods",goodsId);
	}

	public void updateGoods(GoodsVo goodsVo,HttpServletRequest request) throws IOException {
		GoodsVo beforeGoodsVo = selectGoods(goodsVo.getGoodsId());
		String[] beforeGoodsImages = beforeGoodsVo.getDbGoodsImage().replaceAll("\\[", "").replaceAll("\\]", "").trim().split(",");
		String[] beforeS3Images = beforeGoodsVo.getS3GoodsImage().replaceAll("\\[", "").replaceAll("\\]", "").trim().split(",");
		
		List<String> remainImages = new ArrayList<>();
		List<String> remainS3 = new ArrayList<>();
		
		if(goodsVo.getArrayImage()!=null) {
			
			for(int i = 0; i<beforeGoodsImages.length; i++) {
				int count = 0;
				for(int j = 0 ;j<goodsVo.getArrayImage().length;j++) {
					if(goodsVo.getArrayImage()[j].equals(beforeGoodsImages[i])) {
						count++;
						remainImages.add(beforeGoodsImages[i]);
						remainS3.add(beforeS3Images[i]);
					}
				}
				if(count==0) {
					System.out.println(beforeS3Images[i]);
					s3Service.deleteFile(beforeS3Images[i].trim());
				}
			}
		}else {
			for(int i = 0; i<beforeGoodsImages.length; i++) {
				s3Service.deleteFile(beforeS3Images[i].trim());
			}
		}
		
		if(remainImages.size()>0) {
			goodsVo.setDbGoodsImage(remainImages.toString());
			goodsVo.setS3GoodsImage(remainS3.toString());
			
		}
		insertGoods(goodsVo, request);
				
				
	}
	public void deleteGoods(int goodsId) {
		GoodsVo goodsVo = selectGoods(goodsId);
		if(goodsVo.getS3GoodsImage() != null) {
			String[] s3images = goodsVo.getS3GoodsImage().replaceAll("\\[", "").replaceAll("\\]", "").trim().split(",");
			for(int i= 0;i<s3images.length; i++) {
				s3Service.deleteFile(s3images[i]);
			}
		}
		session.delete("goodsMapper.deleteGoods",goodsId);
	}
	
	
	public List<GoodsVo> selectOrderBy(Map<String, Object> map) {
		return session.selectList("goodsMapper.goodsSelecOrderBy", map);
	}
	
}
