package com.kkaekkt.biz.user;

import java.util.List;
import java.util.Map;

import com.google.gson.JsonElement;
import com.kkaekkt.biz.comm.ChatVO;
import com.kkaekkt.biz.comm.LaundryVO;

public interface UserService {
	public void insertUser(PersonVO vo);
	public void insertUser(BusinessVO vo);
	public void updateUser(PersonVO vo);
	public void updateUser(BusinessVO vo);
	public String deleteUser(AccountVO vo);
	public void deleteUser(BusinessVO vo);
	public void likeOn(BusinessVO vo);
	public void likeOff(BusinessVO vo);
	public AccountVO getUser(AccountVO vo);
	public List<BusinessVO> getLikedBs(int mno);
	public BusinessVO getComspec(BusinessVO vo);
	public BusinessVO getCoinspec(BusinessVO vo);
	public void updateSpec(BusinessVO vo);
	public AccountVO findId(AccountVO vo);
	public AccountVO findPw(AccountVO vo);
	public int idchk(PersonVO vo);
	public int emailchk(String email);
	public AccountVO method(AccountVO vo);
	public AccountVO joinCfm(AccountVO vo);
	public double avgGradeBs(BusinessVO vo);
	public int countLikeBs(BusinessVO vo);	
	public PersonVO getPerson(int mno);
	public BusinessVO getBusiness(BusinessVO vo);
	public List<LaundryVO> getLaundryList(int bno);
    public void updatePw(AccountVO vo);
	public int bnoChk(int bno);
	public Map<String, Object> crtRoom(ChatVO vo);
	public void sendChat(ChatVO vo);
	public void readChat(ChatVO vo);
	public void exitChatRoom(ChatVO vo);
	public List<ChatVO> readChatRog(ChatVO vo);
	public List<ChatVO> initRoomLi(ChatVO vo);
}
