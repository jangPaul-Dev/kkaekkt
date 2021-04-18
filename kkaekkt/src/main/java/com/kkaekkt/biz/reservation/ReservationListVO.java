package com.kkaekkt.biz.reservation;

import java.util.List;

import com.kkaekkt.biz.comm.Criteria;
import com.kkaekkt.biz.comm.LaundryVO;

public class ReservationListVO extends Criteria{
	private int mno;//회원번호
	private int bno;//업체번호
	private int state;//작업 상태 : 1.세탁 중 2.세탁 완료 3.전달 완료 4.취소
	private int laundryType; //품목별 1.일반의류 2.와이셔츠 3.이불 4.운동화 5.가죽모피 6.명품가방 7.아웃도어 8.기타
	private int order; // 정렬 : 1.주문번호 순  2.남은일자 순
	private String search; //검색어
	private int searchOption; // 1.이름   2.주문번호 조회
	private int listType; //1.일반 조회   2.품목별 조회   3.주문번호별-처리중 조회  4.주문번호별-완료목록 조회
	private List<ReservationVO> rsvListRno; // 주문번호별 리스트
	private List<LaundryVO> rsvListLno; // 품목별 리스트
	
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getLaundryType() {
		return laundryType;
	}
	public void setLaundryType(int laundryType) {
		this.laundryType = laundryType;
	}
	public int getOrder() {
		return order;
	}
	public void setOrder(int order) {
		this.order = order;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public int getSearchOption() {
		return searchOption;
	}
	public void setSearchOption(int searchOption) {
		this.searchOption = searchOption;
	}
	public int getListType() {
		return listType;
	}
	public void setListType(int listType) {
		this.listType = listType;
	}
	public List<ReservationVO> getRsvListRno() {
		return rsvListRno;
	}
	public void setRsvListRno(List<ReservationVO> rsvListRno) {
		this.rsvListRno = rsvListRno;
	}
	public List<LaundryVO> getRsvListLno() {
		return rsvListLno;
	}
	public void setRsvListLno(List<LaundryVO> rsvListLno) {
		this.rsvListLno = rsvListLno;
	}
}
