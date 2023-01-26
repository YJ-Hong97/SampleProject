package com.sample.myapp.goods;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sample.myapp.PageVO;

@Repository
public class GoodsDAO {
	@Autowired
	private SqlSession session;
	public List<GoodsVo> selectAll(PageVO page){
		return session.selectList("goodsMapper.goodsSelectAll",page);
	}
	public int totalCount() {
		return session.selectOne("goodsMapper.goodsTotal");
	}
	public List<GoodsTypeVo> selectAllType(){
		return session.selectList("goodsMapper.goodsTypeSelectAll");
	}
	public List<EmojiVo> selectAllEmojis(PageVO page){
		return session.selectList("goodsMapper.emojisSelectAll",page);
	}
	public Integer countEmojis() {
		return session.selectOne("goodsMapper.emojisCount");
	}
	
	public List<String> selectOption(){
 		return session.selectList("goodsMapper.goodsOption");
 	}
}
