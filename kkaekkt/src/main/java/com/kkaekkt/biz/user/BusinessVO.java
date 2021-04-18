package com.kkaekkt.biz.user;

import java.util.List;

import com.kkaekkt.biz.comm.CommVO;
import com.kkaekkt.biz.comm.EquipmentVO;
import com.kkaekkt.biz.comm.EtcVO;
import com.kkaekkt.biz.comm.LaundryVO;
import com.kkaekkt.biz.comm.ScheduleVO;

public class BusinessVO extends AccountVO{
	private String bname;
	private String comment;
	private int bizType; //1. 일반 세탁소, 2. 코인 세탁소
	private int bankNum;
	private String bankAccountNum;
	private List<ScheduleVO> scheduleList;
	private List<EquipmentVO> equipmentList;
	private List<LaundryVO> laundryList;
	private List<EtcVO> etcList;
	private List<CommVO> commList;
	private String equipment;
	private String laundry;
	private String schedule;
	private String etc; //부가서비스
	private double eval; //평가
	private int count; //댓글 개수
	private int likedNum; // 찜당한 수

	private int state=1; // 테스트
	
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public List<CommVO> getCommList() {
		return commList;
	}
	public void setCommList(List<CommVO> commList) {
		this.commList = commList;
	}
	public List<EtcVO> getEtcList() {
		return etcList;
	}
	public void setEtcList(List<EtcVO> etcList) {
		this.etcList = etcList;
	}
	public String getLaundry() {
		return laundry;
	}
	public void setLaundry(String laundry) {
		this.laundry = laundry;
	}
	public int getBankNum() {
		return bankNum;
	}
	public void setBankNum(int bankNum) {
		this.bankNum = bankNum;
	}
	public String getEquipment() {
		return equipment;
	}
	public void setEquipment(String equipment) {
		this.equipment = equipment;
	}

	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public int getBizType() {
		return bizType;
	}
	public void setBizType(int bizType) {
		this.bizType = bizType;
	}

	public String getBankAccountNum() {
		return bankAccountNum;
	}
	public void setBankAccountNum(String bankAccountNum) {
		this.bankAccountNum = bankAccountNum;
	}
	public List<ScheduleVO> getScheduleList() {
		return scheduleList;
	}
	public void setScheduleList(List<ScheduleVO> scheduleList) {
		this.scheduleList = scheduleList;
	}
	public List<EquipmentVO> getEquipmentList() {
		return equipmentList;
	}
	public void setEquipmentList(List<EquipmentVO> equipmentList) {
		this.equipmentList = equipmentList;
	}
	public List<LaundryVO> getLaundryList() {
		return laundryList;
	}
	public void setLaundryList(List<LaundryVO> laundryList) {
		this.laundryList = laundryList;
	}
	public String getSchedule() {
		return schedule;
	}
	public void setSchedule(String schedule) {
		this.schedule = schedule;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public double getEval() {
		return eval;
	}
	public void setEval(double eval) {
		this.eval = eval;
	}
	public int getLikedNum() {
		return likedNum;
	}
	public void setLikedNum(int likedNum) {
		this.likedNum = likedNum;
	}
	@Override
	public String toString() {
		return "BusinessVO [bname=" + bname + ", comment=" + comment + ", bizType=" + bizType + ", bankNum=" + bankNum
				+ ", bankAccountNum=" + bankAccountNum + ", scheduleList=" + scheduleList + ", equipmentList="
				+ equipmentList + ", laundryList=" + laundryList + ", etcList=" + etcList + ", commList=" + commList
				+ ", equipment=" + equipment + ", laundry=" + laundry + ", schedule=" + schedule + ", etc=" + etc
				+ ", eval=" + eval + ", count=" + count + ", likedNum=" + likedNum + ", state=" + state + "]";
	}
	


}
