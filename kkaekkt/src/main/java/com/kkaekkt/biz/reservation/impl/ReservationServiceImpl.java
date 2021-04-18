package com.kkaekkt.biz.reservation.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kkaekkt.biz.comm.AlertVO;
import com.kkaekkt.biz.comm.CommListVO;
import com.kkaekkt.biz.comm.CommVO;
import com.kkaekkt.biz.comm.LaundryVO;
import com.kkaekkt.biz.reservation.ReservationListVO;
import com.kkaekkt.biz.reservation.ReservationService;
import com.kkaekkt.biz.reservation.ReservationVO;
import com.kkaekkt.biz.user.BusinessVO;

@Service("ReservationService")
public class ReservationServiceImpl implements ReservationService {
	@Autowired
	ReservationDAO reservationDAO;
	@Override
	public void regitComm(CommVO vo) {
		if(vo.getDepth()==1) {
			CommVO data=reservationDAO.getCustomerData(vo);
			vo.setOrderNum(data.getOrderNum());
			vo.setEval(data.getEval());
			vo.setMno(data.getMno());
			reservationDAO.insertUpdateOrderNum(vo);			
		}
		reservationDAO.regitComm(vo);
	}
	public void insertRsv(ReservationVO vo) {
		reservationDAO.insertRsv(vo);
	}
	@Override
	public String cancel(LaundryVO vo) {
		if(vo.getLaundry()==null) {//예약번호단위 취소라면
			reservationDAO.cancelRsv(vo);
			return "cancel";
		}else {
			reservationDAO.cancelLaundry(vo);
			int result=reservationDAO.chkState(vo);//모든 품목의 상태 체크
			if(result==0) {//만약 모든 품목 상태가 세탁중이 아니라면
				result=reservationDAO.chkStateComplete(vo);//품목 중 완료상태가 하나라도 있는지 체크
				if(result==0) {//전체 취소된 상태라면
					reservationDAO.cancelRsv(vo);
					return "cancel";//주문이 취소되었음을 전달함
				}else {//완료품목이 하나라도 존재한다면
					reservationDAO.rsvDone(vo);//주문 전체상태 완료로 전환
					return "complete";//주문이 완료되었음을 전달함
				}
			}
		}
		return null;
	}
	@Override
	public void complete(LaundryVO vo) {
		reservationDAO.complete(vo);
	}
	@Override
	public ReservationListVO getRsvListPs(ReservationListVO vo) {
		vo.setTotalPostCount(reservationDAO.countList(vo)); // 총 데이터행 입력
		vo.booleanSet(); // 페이징 정보 입력
		vo.setRsvListRno(reservationDAO.getRsvListPs(vo));
		
		for (ReservationVO rsvVO : vo.getRsvListRno()) {
			rsvVO.setLike(reservationDAO.getLiked(rsvVO));
			rsvVO.setLaundryList(reservationDAO.getLaundryList(rsvVO));
			rsvVO.setCommList(reservationDAO.getCommListPs(rsvVO));
		}
		return vo;
	}

	@Override
	public ReservationListVO getRsvListBs(ReservationListVO vo) {
		vo.setTotalPostCount(reservationDAO.countList(vo));// 행 개수 출력
		vo.booleanSet();
		if (vo.getListType() == 2) { // 품목별 리스트라면,
			vo.setRsvListLno(reservationDAO.getRsvListBs_ld(vo));
		} else { // 품목별 리스트가 아니라면
			vo.setRsvListRno(reservationDAO.getRsvListBs_rn(vo));

			for (ReservationVO rsvVO : vo.getRsvListRno()) {
				rsvVO.setLaundryList(reservationDAO.getLaundryList(rsvVO));
			}
		}
		return vo;
	}
	@Override
	public void updateComm(CommVO vo) {
		reservationDAO.updateComm(vo);	
	}
	@Override
	public void deleteCommAb(CommVO vo) {
		vo.setOrderNum(reservationDAO.getOrderNum(vo));
		reservationDAO.deleteUpdateOrderNum(vo);
		reservationDAO.deleteCommAb(vo);
	}
	@Override
	public void deleteCommCh(CommVO vo) {
		reservationDAO.deleteCommCh(vo);	
	}
	@Override
	public CommListVO getCommListBs(CommListVO vo) {
		vo.setTotalPostCount(reservationDAO.getCommCount(vo));
		vo.booleanSet();
		vo.setCommList(reservationDAO.getCommListBs(vo));
		return vo;
	}
	@Override
	public String washingDone(LaundryVO vo) {
		if(vo.getLaundry()==null) {//예약번호단위 완료일 경우
			reservationDAO.rsvDone(vo);	
			return "complete";
		}else {
			reservationDAO.laundryDone(vo);
			int result=reservationDAO.chkState(vo);//모든 품목의 상태 체크
			if(result==0) {//만약 모든 품목 상태가 세탁중이 아니라면
				reservationDAO.rsvDone(vo);//주문 전체상태 완료로 전환
				return "complete";
			}
		}
		return null;
	}
	@Override
	public int regitAlert(AlertVO vo) {
		reservationDAO.regitAlert(vo);
		return reservationDAO.getAno(vo);
	}
	
	@Override
	public ReservationVO getRsvDetail(ReservationVO vo) {
		vo = reservationDAO.getRsvMdetail(vo);
		vo.setLaundryList(reservationDAO.getLaundryList(vo));
		
		return vo;
	}
	@Override
	public List<AlertVO> getAlertList(AlertVO vo) {
		return reservationDAO.getAlertList(vo);		
	}
	@Override
	public void delAlert(AlertVO vo) {
		reservationDAO.delAlert(vo);
	}
	@Override
	public void updateAlert(AlertVO vo) {
		reservationDAO.updateAlert(vo);
	}

	@Override
	public List<LaundryVO> getSales(Map<String, Object> param) { // 하루 매출
		return reservationDAO.getSales(param);
	}
	@Override
	public int getRsvCount(Map<String, Object> param) { // 한달예약건수
		return reservationDAO.getRsvCount(param);
	}
}
