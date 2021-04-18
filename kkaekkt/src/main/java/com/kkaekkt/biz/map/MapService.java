package com.kkaekkt.biz.map;

import java.util.List;

import com.kkaekkt.biz.user.AccountVO;

public interface MapService {
	//데이터 바인딩을 위한 리스트 조회.
	public List<MapListVO> selectlandry(AccountVO vo);
	public List<SingleListVO> selectSingle(int bno);
	public List<SingleListVO> singleOption(int bno);
	public List<SingleListVO> reviewListGrade(int bno);
	public List<SingleListVO> reviewList(int bno);
	public int respay(MapListVO mapvo);
	public int likeYn(SingleListVO vo);

}
