package com.kkaekkt.biz.comm;

public class AlertVO {
	private int ano;//알림번호
	private int sender;//보내는 이 회원번호
	private String senderName;//보낸 이
	private int addressee;//받는 이 회원번호
	private String msg;
	private int typenum;//유형번호
	private String typename;//유형명
	private String date;//보낸 날짜
	private int state;//읽음상태
	private int datediff;//보낸 지 며칠이 지났는 지를 한정하는 수
	
	public int getDatediff() {
		return datediff;
	}
	public void setDatediff(int datediff) {
		this.datediff = datediff;
	}
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public void setMname(String mname) {
		this.senderName=mname;
	}
	public void setBname(String bname) {
		this.senderName=bname;
	}
	public String getSenderName() {
		return senderName;
	}
	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}
	public int getTypenum() {
		return typenum;
	}
	public void setTypenum(int typenum) {
		this.typenum = typenum;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTypename() {
		return typename;
	}
	public void setTypename(String typename) {
		this.typename = typename;
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
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	@Override
	public String toString() {
		return "AlertVO [sender=" + sender + ", addressee=" + addressee + ", msg=" + msg + ", typenum=" + typenum + "]";
	}		
}
