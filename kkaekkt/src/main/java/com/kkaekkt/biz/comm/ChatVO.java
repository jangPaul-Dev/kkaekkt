package com.kkaekkt.biz.comm;

public class ChatVO {
	int mno;
	int bno;
	int mtype;//채팅방 DB 검색시에 사용
	
	int roomnum; //방번호
	int sender; //보낸 이(항상 본인의 mno가 담긴다)
	int addressee; //수신인 회원번호
	String guest; //수신인 명
	String content; //내용
	String closetime; //닫은 시간
	String stime;//보낸 시간
	int state; // 상태번호
	int closer; // 나간사람의 번호
	int counts; //읽지않은 채팅의 개수	
	
	public int getCounts() {
		return counts;
	}
	public void setCounts(int counts) {
		this.counts = counts;
	}
	public String getGuest() {
		return guest;
	}
	public void setGuest(String guest) {
		this.guest = guest;
	}
	public int getMtype() {
		return mtype;
	}
	public void setMtype(int mtype) {
		this.mtype = mtype;
	}
	public String getStime() {
		return stime;
	}
	public void setStime(String stime) {
		this.stime = stime;
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
	public int getRoomnum() {
		return roomnum;
	}
	public void setRoomnum(int roomnum) {
		this.roomnum = roomnum;
	}
	public int getSender() {
		return sender;
	}
	public void setSender(int sender) {
		this.sender = sender;
	}
	public int getAddressee() {
		return addressee;
	}
	public void setAddressee(int addressee) {
		this.addressee = addressee;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getClosetime() {
		return closetime;
	}
	public void setClosetime(String closetime) {
		this.closetime = closetime;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getCloser() {
		return closer;
	}
	public void setCloser(int closer) {
		this.closer = closer;
	}
	@Override
	public String toString() {
		return "ChatVO [mno=" + mno + ", bno=" + bno + ", mtype=" + mtype + ", roomnum=" + roomnum + ", sender="
				+ sender + ", addressee=" + addressee + ", guest=" + guest + ", content=" + content + ", closetime="
				+ closetime + ", stime=" + stime + ", state=" + state + ", closer=" + closer + "]";
	}
}
