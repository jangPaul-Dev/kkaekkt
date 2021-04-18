package com.kkaekkt.biz.map;


public class ResPayVO {
	
	//예약정보 -------------------------
	int lno;
	int cnt;
	
	public int getLno() {
		return lno;
	}
	public void setLno(int lno) {
		this.lno = lno;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	@Override
	public String toString() {
		return "ResPayVO [lno=" + lno + ", cnt=" + cnt + "]";
	}
	
	
	
	
	
}
