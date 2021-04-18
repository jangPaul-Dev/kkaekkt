package com.kkaekkt.biz.map;


import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;


public class SingleListVO {
	
	//laundryinfo-------------------------
	int no;
	int mno; //알림 전송을 위한 업체의 mno?
	int bno; //like 조회
	int lno;
	int price;
	String product;
	String name;
	String week;
	String time;
	String content;
	String mname;
	String grade;
	
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="YYYY.MM.DD")
	Date rdate;
	

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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public Date getRdate() {
		return rdate;
	}

	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public int getLno() {
		return lno;
	}
	
	public void setLno(int lno) {
		this.lno = lno;
	}
	
	public int getPrice() {
		return price;
	}
	
	public void setPrice(int price) {
		this.price = price;
	}
	
	public String getProduct() {
		return product;
	}
	
	public void setProduct(String product) {
		this.product = product;
	}

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getWeek() {
		return week;
	}
	
	public void setWeek(String week) {
		this.week = week;
	}
	
	public String getTime() {
		return time;
	}
	
	public void setTime(String time) {
		this.time = time;
	}

	@Override
	public String toString() {
		return "SingleListVO [no=" + no + ", mno=" + mno + ", bno=" + bno + ", lno=" + lno + ", price=" + price
				+ ", product=" + product + ", name=" + name + ", week=" + week + ", time=" + time
				+ ", content=" + content + ", mname=" + mname + ", grade=" + grade + ", rdate=" + rdate + "]";
	}

	
	
	
}
