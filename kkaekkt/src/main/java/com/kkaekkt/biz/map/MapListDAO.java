package com.kkaekkt.biz.map;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kkaekkt.biz.user.AccountVO;
import com.kkaekkt.biz.user.BusinessVO;

@Repository
public class MapListDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public MapListDAO() {
		System.out.println("[MapListDAO 진입---------------------]");		
	}
	
	public List<MapListVO> selectlandry(AccountVO vo) {	
		return mybatis.selectList("MapListDAO.selecList", vo);
	}

	public List<SingleListVO> selectSingle(int bno) {
		 return mybatis.selectList("MapListDAO.selectSingle",bno); 
	}

	public List<SingleListVO> selectOption(int bno) {
		return mybatis.selectList("MapListDAO.selectOption",bno); 
	}
	
	public List<SingleListVO> reviewList(int bno) {
		return mybatis.selectList("MapListDAO.reviewList",bno); 
	}
	
	public List<SingleListVO> reviewListGrade(int bno) {
		return mybatis.selectList("MapListDAO.reviewListGrade",bno); 
	}

	public void respay(MapListVO mapvo) {
		mybatis.insert("MapListDAO.respay",mapvo);		
	}

	public int getRsvNum(int mno) {
		return mybatis.selectOne("reservationDAO.getRno",mno);
	}
	
	public int likeYn(SingleListVO vo) {
		return mybatis.selectOne("MapListDAO.selectLike",vo);
	}
}
