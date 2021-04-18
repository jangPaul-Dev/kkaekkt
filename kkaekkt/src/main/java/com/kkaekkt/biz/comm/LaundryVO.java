package com.kkaekkt.biz.comm;


public class LaundryVO {
	private String rsvDate;
	private int rsvNum;
	private String mname;
	private String bname;
	private int mno;
	private int dDay;
	private int lno;
	private String laundry;
	private int count; 
	private String state;
	private int price;
	
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getLno() {
		return lno;
	}
	public void setLno(int lno) {
		this.lno = lno;
	}
	public String getLaundry() {
		return laundry;
	}
	public void setLaundry(String laundry) {
		this.laundry = laundry;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getState() {
		return state;
	}
//	public Date getRsvDate() {
//		return rsvDate;
//	}
//	public void setRsvDate(Date rsvDate) {
//		this.rsvDate = rsvDate;
//	}
	public String getRsvDate() {
		return rsvDate;
	}
	public void setRsvDate(String rsvDate) {
		this.rsvDate = rsvDate;
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
	public int getdDay() {
		return dDay;
	}
	public void setdDay(int dDay) {
		this.dDay = dDay;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "LaundryVO [rsvDate=" + rsvDate + ", rsvNum=" + rsvNum + ", mname=" + mname + ", dDay=" + dDay + ", lno="
				+ lno + ", laundry=" + laundry + ", count=" + count + ", state=" + state + ", price=" + price + "]";
	}
	
}
