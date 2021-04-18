package com.kkaekkt.biz.reservation.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kkaekkt.biz.comm.AlertVO;
import com.kkaekkt.biz.comm.CommListVO;
import com.kkaekkt.biz.comm.CommVO;
import com.kkaekkt.biz.comm.LaundryVO;
import com.kkaekkt.biz.reservation.ReservationListVO;
import com.kkaekkt.biz.reservation.ReservationVO;
import com.kkaekkt.biz.user.BusinessVO;
@Repository
public class ReservationDAO {	
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertRsv(ReservationVO vo) {

	}
	public void cancelRsv(LaundryVO vo) {
		mybatis.update("reservationDAO.cancelRsv",vo);
	}
	public void doneLaundry(LaundryVO vo) {
		mybatis.update("reservationDAO.doneLaundry",vo);
	}
	public int getLiked(ReservationVO vo) {
		return mybatis.selectOne("reservationDAO.checkLiked",vo);
	}
	public List<ReservationVO> getRsvListPs(ReservationListVO vo) {		
		return mybatis.selectList("reservationDAO.getRsvListPs",vo);
	}
	public List<LaundryVO> getLaundryList(ReservationVO vo) {
		return mybatis.selectList("reservationDAO.getLaundry",vo);
	}
	public int countList(ReservationListVO vo) {
		return mybatis.selectOne("reservationDAO.countList",vo);
	}
	public List<CommVO> getCommListPs(ReservationVO vo) {
		return mybatis.selectList("reservationDAO.getCommListPs",vo);
	}
	public List<ReservationVO> getRsvListBs_rn(ReservationListVO vo) {
		return mybatis.selectList("reservationDAO.getRsvListBs_rn",vo);
	}
	public List<LaundryVO> getRsvListBs_ld(ReservationListVO vo) {
		return mybatis.selectList("reservationDAO.getRsvListBs_ld",vo);
	}
	public void regitComm(CommVO vo) {
		mybatis.insert("reservationDAO.regitComm",vo);		
	}
	public void updateComm(CommVO vo) {
		mybatis.update("reservationDAO.updateComm",vo);		
	}
	public void deleteCommAb(CommVO vo) {
		mybatis.delete("reservationDAO.deleteCommAb",vo);
	}
	public void deleteCommCh(CommVO vo) {
		mybatis.update("reservationDAO.deleteCommCh",vo);		
	}
	public List<CommVO> getCommListBs(CommListVO vo) {
		return mybatis.selectList("reservationDAO.getCommListBs",vo);
	}
	public void insertUpdateOrderNum(CommVO vo) {
		mybatis.update("reservationDAO.insertUpdateOrderNum",vo);
	}
	public int getCommCount(CommListVO vo) {
		return mybatis.selectOne("reservationDAO.getCommCount",vo);	
	}
	public CommVO getCustomerData(CommVO vo) {
		return mybatis.selectOne("reservationDAO.getCustomerData",vo);
	}
	public void deleteUpdateOrderNum(CommVO vo) {
		mybatis.update("reservationDAO.deleteUpdateOrderNum",vo);
		
	}
	public int getOrderNum(CommVO vo) {
		return mybatis.selectOne("reservationDAO.getOrderNum",vo);
	}
	public int chkState(LaundryVO vo) {
		return mybatis.selectOne("reservationDAO.chkLaundryStateTotal",vo);
	}
	public int chkStateComplete(LaundryVO vo) {
		return mybatis.selectOne("reservationDAO.chkLaundryStateComplete",vo);
	}
	public void cancelLaundry(LaundryVO vo) {
		mybatis.update("reservationDAO.cancelLaundry",vo);
	}
	public void laundryDone(LaundryVO vo) {
		mybatis.update("reservationDAO.laundryDone",vo);
	}
	public void rsvDone(LaundryVO vo) {
		mybatis.update("reservationDAO.rsvDone",vo);
		
	}
	public void complete(LaundryVO vo) {
		mybatis.update("reservationDAO.completeRsv",vo);
	}
	public void regitAlert(AlertVO vo) {
		mybatis.insert("reservationDAO.regitAlert",vo);		
	}
	public List<AlertVO> getAlertList(AlertVO vo) {
		return mybatis.selectList("reservationDAO.getAlertList",vo);
		 
	}
	public void delAlert(AlertVO vo) {
		mybatis.delete("reservationDAO.delAlert",vo);		
	}
	
	public ReservationVO getRsvMdetail(ReservationVO vo) {
		return mybatis.selectOne("reservationDAO.getRsvMdetail",vo);
	}
	public void updateAlert(AlertVO vo) {
		mybatis.update("reservationDAO.updateAlert",vo);		
	}
	public int getAno(AlertVO vo) {
		return mybatis.selectOne("reservationDAO.getAno",vo);
	}

	// 매출관리
	public List<LaundryVO> getSales(Map<String, Object> param) {
		return mybatis.selectList("reservationDAO.getSales", param);
	}
	public int getRsvCount(Map<String, Object> param) {
		return mybatis.selectOne("reservationDAO.getRsvCount", param);
	}
	
}
