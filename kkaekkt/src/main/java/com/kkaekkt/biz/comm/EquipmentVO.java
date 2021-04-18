package com.kkaekkt.biz.comm;

public class EquipmentVO {
	private int eno;
	private int cnt;
	private int price;
	
	public int getEno() {
		return eno;
	}
	public void setEno(int eno) {
		this.eno = eno;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(String cnt) {
		this.cnt = Integer.parseInt(cnt);
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = Integer.parseInt(price);
	}
	@Override
	public String toString() {
		return "EquipmentVO [eno=" + eno + ", cnt=" + cnt + ", price=" + price + "]";
	}
	
}
