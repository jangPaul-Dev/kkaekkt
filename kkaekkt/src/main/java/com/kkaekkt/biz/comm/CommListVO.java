package com.kkaekkt.biz.comm;

import java.util.List;

public class CommListVO extends Criteria{
	private final int COMMS_PER_PAGE=10;
	private int mno;
	private int bno;
	private int order; // 정렬 : 1.등록 순  2.평점 순
	private String search; //검색어
	private int searchOption; // 1.이름   2.주문번호 조회 3.평점
	private int replytf=1; //답글 달린 리뷰 구분 0.답글 없는 리뷰 1. 전체 조회 (Default=1)
	private List<CommVO> commList;
	
	@Override
	public void setCurrentPageNum(int currentPageNum) {
		this.currentPageNum = currentPageNum;
		this.setRowStartNum((currentPageNum-1)*COMMS_PER_PAGE);
	}
	@Override
	public void setTotalPostCount(int totalPostCount) {
		this.totalPostCount = totalPostCount;
		if(totalPostCount==0) {
			this.setTotalLastPageNum(0);
		} else {
			this.setTotalLastPageNum((int) Math.ceil((double) totalPostCount / COMMS_PER_PAGE));
		}
	}
	
	public int getReplytf() {
		return replytf;
	}
	public void setReplytf(int replytf) {
		this.replytf = replytf;
	}
	public int getPOSTS_PER_PAGE() {
		return COMMS_PER_PAGE;
	}
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
	public List<CommVO> getCommList() {
		return commList;
	}
	public void setCommList(List<CommVO> commList) {
		this.commList = commList;
	}
	@Override
	public String toString() {
		return "CommListVO [mno=" + mno + ", bno=" + bno + ", order=" + order + ", search=" + search + ", searchOption="
				+ searchOption + ", commList=" + commList + "]";
	}
	
}
