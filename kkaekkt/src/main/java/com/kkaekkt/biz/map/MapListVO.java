package com.kkaekkt.biz.map;

import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;

public class MapListVO {
	
	//세탁 리스트를 위한 
	int bno;
	String bname;
	String phone;
	String address;
	int content;
	String rdate;
	int grade;	
	
	//예약을 위한 유저 정보
	int mno;
	int totalPrice;
	int rbno;
	int ddate;
	List<ResPayVO> resList;
	String resListData;
	
	public int getDdate() {
		return ddate;
	}
	public void setDdate(int ddate) {
		this.ddate = ddate;
	}
	public void setResListData(String resListData) {
		String temp = resListData.substring(1, resListData.length() - 1); // 양 끝의 [ ] 제거
		String[] temp2 = temp.split("},"); // {~},{~} 을 split하여 배열로 나눔
		this.resList = new ArrayList<ResPayVO>();
		Gson gson = new Gson();
		for (int i = 0; i < temp2.length; i++) {
			if (i != temp2.length - 1) {// 만약 마지막 { ~ }이 아니라면,
				temp2[i] += "}";// split 과정에서 떨어졌던 '}'를 붙여준다.
			}
		this.resList.add(gson.fromJson(temp2[i], ResPayVO.class));
		}
	}
	public List<ResPayVO> getResList() {
		return resList;
	}
	public void setResList(List<ResPayVO> resList) {
		this.resList = resList;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getRbno() {
		return rbno;
	}
	public void setRbno(int rbno) {
		this.rbno = rbno;
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
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getContent() {
		return content;
	}
	public void setContent(int content) {
		this.content = content;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	
	@Override
	public String toString() {
		return "MapListVO [bno=" + bno + ", bname=" + bname + ", phone=" + phone + ", address=" + address + ", content="
				+ content + ", rdate=" + rdate + ", grade=" + grade + ", mno=" + mno + ", totalPrice=" + totalPrice
				+ ", rbno=" + rbno + ", resList=" + resList + "]";
	}
	
	
	
		
	
	
	
}
