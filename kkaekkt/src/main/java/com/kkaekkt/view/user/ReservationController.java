package com.kkaekkt.view.user;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kkaekkt.biz.comm.AlertVO;
import com.kkaekkt.biz.comm.CommListVO;
import com.kkaekkt.biz.comm.CommVO;
import com.kkaekkt.biz.comm.LaundryVO;
import com.kkaekkt.biz.reservation.ReservationListVO;
import com.kkaekkt.biz.reservation.ReservationService;
import com.kkaekkt.biz.reservation.ReservationVO;

@Controller
public class ReservationController {
	@Autowired
	ReservationService reservationService;

	@RequestMapping(value="/getRsvListPs.do",method=RequestMethod.POST,produces="application/text;charset=utf-8")
	@ResponseBody
	public String getRsvListPs(ReservationListVO vo) {
		System.out.println(vo);
		Gson gson=new Gson();
		String result=gson.toJson(reservationService.getRsvListPs(vo));
		return result;
	}
	@RequestMapping(value="/getRsvListBs.do",method=RequestMethod.POST,produces="application/text;charset=utf-8")
	@ResponseBody
	public String getRsvListBs(ReservationListVO vo) {
		System.out.println(vo);
		Gson gson=new Gson();
		String result=gson.toJson(reservationService.getRsvListBs(vo));
		return result;
	}
	@RequestMapping(value="/cancel.do", method=RequestMethod.POST)
	@ResponseBody
	public String cancel(LaundryVO vo) {//주문단위 취소 처리되면 cancel 반환, 주문단위 완료 처리되면 complete 반환
		return reservationService.cancel(vo);
	}
	@RequestMapping(value="/washingDone.do", method=RequestMethod.POST)
	@ResponseBody
	public String washingDone(LaundryVO vo) {//주문단위 완료처리되면 complete반환
		return reservationService.washingDone(vo);
	}
	@RequestMapping(value="/complete.do", method=RequestMethod.POST)
	@ResponseBody
	public void completeRsv(LaundryVO vo) {
		reservationService.complete(vo);
	}
	@RequestMapping(value="/regitComm.do", method=RequestMethod.POST)
	@ResponseBody
	public void regitComm(CommVO vo) {
		System.out.println(vo);
		reservationService.regitComm(vo);
	}
	@RequestMapping(value="/updateComm.do", method=RequestMethod.POST)
	@ResponseBody
	public void updateComm(CommVO vo) {
		reservationService.updateComm(vo);
	}
	@RequestMapping(value="/deleteCommAb.do", method=RequestMethod.POST)//완전히 지움
	@ResponseBody
	public void deleteCommPf(CommVO vo) {
		reservationService.deleteCommAb(vo);
	}
	@RequestMapping(value="/deleteCommCh.do", method=RequestMethod.POST)//'삭제된 리뷰입니다'로 바꿈
	@ResponseBody
	public void deleteCommCh(CommVO vo) {
		reservationService.deleteCommCh(vo);
	}
	@RequestMapping(value="/getCommListBs.do", method=RequestMethod.POST,produces="application/text;charset=utf-8")//리뷰관리 리스트조회
	@ResponseBody
	public String getCommListBs(CommListVO vo) {
		System.out.println(vo);
		Gson gson=new Gson();
		String result=gson.toJson(reservationService.getCommListBs(vo));
		return result;
	}
	@RequestMapping(value="/regitAlert.do",method=RequestMethod.POST)
	@ResponseBody
	public int regitAlert(AlertVO vo) {
		return reservationService.regitAlert(vo);
	}
	// 주문전표인쇄 창
	@RequestMapping(value="/openPopup.do",method=RequestMethod.GET)
	public String openPopup(ReservationVO vo, Model model) {
		System.out.println(reservationService.getRsvDetail(vo));
		model.addAttribute("rsv", reservationService.getRsvDetail(vo) );
		return "/jsp/mypageBiz/orderPopup.jsp";
	}
	@RequestMapping(value="/getAlertList.do",method=RequestMethod.POST,produces="application/text;charset=utf-8")
	@ResponseBody//알림 리스트 조회
	public String getAlertList(AlertVO vo) {
		Gson gson=new Gson();
		return gson.toJson(reservationService.getAlertList(vo));
	}
	@RequestMapping(value="/delAlert.do",method=RequestMethod.POST)
	@ResponseBody
	public void delAlert(AlertVO vo) {
		reservationService.delAlert(vo);
	}
	@RequestMapping(value="/updateAlert.do",method=RequestMethod.POST)
	@ResponseBody
	public void updateAlert(AlertVO vo) {
		reservationService.updateAlert(vo);
	}
	// 매출관리
	@RequestMapping(value = "/selectSales.do", method = RequestMethod.POST, produces = "application/text;charset=utf-8")
	@ResponseBody
	public String selectSalse(String bno, Date startDt, Date endDt) {
		Map<String, Object> param = new HashMap<>(); 
		System.out.println(startDt +","+ endDt );
		param.put("bno", bno); 
		param.put("startDt", startDt);
		param.put("endDt", endDt);
		Gson gson = new Gson();
		
		Map<String, Object> val = new HashMap<>();
		val.put("sales", reservationService.getSales(param));
		val.put("count", reservationService.getRsvCount(param));
		System.out.println("test:" + val);
		return gson.toJson(val);
		
	}
}
