package com.kkaekkt.biz.comm;

public class ChatVO {
	//채팅방 검색시에 사용
	int mno;
	int bno;
	
	int roomnum; //방번호
	int sender; //보낸 이(항상 본인의 mno가 담긴다)
	int addressee; //받는 이
	String content; //내용
	String closetime; //닫은 시간
	String stime;//보낸 시간
	int state; // 상태번호
	int closer; // 나간사람의 번호
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
		return "ChatVO [mno=" + mno + ", bno=" + bno + ", roomnum=" + roomnum + ", sender=" + sender + ", addressee="
				+ addressee + ", content=" + content + ", closetime=" + closetime + ", state=" + state + ", closer="
				+ closer + "]";
	}
	
}
