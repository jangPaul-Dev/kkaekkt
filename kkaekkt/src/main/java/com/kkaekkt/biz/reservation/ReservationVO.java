package com.kkaekkt.biz.reservation;

import java.util.List;

import com.kkaekkt.biz.comm.CommVO;
import com.kkaekkt.biz.comm.LaundryVO;

public class ReservationVO {
	private int rsvNum; // 예약번호
	private int bno;
	private int mno;//개인회원 번호가 담길수도, 업체회원 번호가 담길수도 있음
	private String mname; // 회원명
	private String bname; // 업체명
	private String rsvDate; // 예약일자
	private String phone; // 전화번호
	private String dDate; // 마감일자
	private int dDay; //마감까지 남은 일자
	private String state; // 상태명
	private int like; // 0.좋아요X 1.좋아요O
	private int timeOut; //0.취소불가 1.취소가능
	private List<LaundryVO> laundryList; // 품목리스트
	private List<CommVO> commList; //리뷰 리스트
	private String address; 
	
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public List<CommVO> getCommList() {
		return commList;
	}
	public void setCommList(List<CommVO> commList) {
		this.commList = commList;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getLike() {
		return like;
	}
	public void setLike(int like) {
		this.like = like;
	}
	public int getTimeOut() {
		return timeOut;
	}
	public void setTimeOut(int timeOut) {
		this.timeOut = timeOut;
	}
	public int getdDay() {
		return dDay;
	}
	public void setdDay(int dDay) {
		this.dDay = dDay;
	}
	public int getRsvNum() {
		return rsvNum;
	}
	public void setRsvNum(int rsvNum) {
		this.rsvNum = rsvNum;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getPhone() {
		return phone;
	}
	public String getRsvDate() {
		return rsvDate;
	}
	public void setRsvDate(String rsvDate) {
		this.rsvDate = rsvDate;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getState() {
		return state;
	}
	public String getdDate() {
		return dDate;
	}
	public void setdDate(String dDate) {
		this.dDate = dDate;
	}
	public void setState(String state) {
		this.state = state;
	}
	public List<LaundryVO> getLaundryList() {
		return laundryList;
	}
	public void setLaundryList(List<LaundryVO> laundryList) {
		this.laundryList = laundryList;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	@Override
	public String toString() {
		return "ReservationVO [rsvNum=" + rsvNum + ", bno=" + bno + ", mno=" + mno + ", mname=" + mname + ", bname="
				+ bname + ", rsvDate=" + rsvDate + ", phone=" + phone + ", dDate=" + dDate + ", dDay=" + dDay
				+ ", state=" + state + ", like=" + like + ", timeOut=" + timeOut
				+ ", laundryList=" + laundryList + ", commList=" + commList + "]";
	}
	
	
}
