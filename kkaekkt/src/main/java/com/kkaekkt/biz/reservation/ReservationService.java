package com.kkaekkt.biz.reservation;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.google.gson.JsonElement;
import com.kkaekkt.biz.comm.AlertVO;
import com.kkaekkt.biz.comm.CommListVO;
import com.kkaekkt.biz.comm.CommVO;
import com.kkaekkt.biz.comm.LaundryVO;

public interface ReservationService {
	public void insertRsv(ReservationVO vo);
	public String cancel(LaundryVO vo);
	public void complete(LaundryVO vo);
	public ReservationListVO getRsvListPs(ReservationListVO vo);
	public ReservationListVO getRsvListBs(ReservationListVO vo);
	public void regitComm(CommVO vo);
	public void updateComm(CommVO vo);
	public void deleteCommAb(CommVO vo);
	public void deleteCommCh(CommVO vo);
	public CommListVO getCommListBs(CommListVO vo);
	public String washingDone(LaundryVO vo);
	public int regitAlert(AlertVO vo);
	public ReservationVO getRsvDetail(ReservationVO vo);
	public List<AlertVO> getAlertList(AlertVO vo);
	public void delAlert(AlertVO vo);
	public void updateAlert(AlertVO vo);
	public List<LaundryVO> getSales(Map<String, Object> param);
	public int getRsvCount(Map<String, Object> param);
}
