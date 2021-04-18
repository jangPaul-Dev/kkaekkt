package com.kkaekkt.biz.comm;

public class ScheduleVO {
	private int schno;
	private String time;
	public int getSchno() {
		return schno;
	}
	public void setSchno(int schno) {
		this.schno = schno;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	@Override
	public String toString() {
		return "ScheduleVO [schno=" + schno + ", time=" + time + "]";
	}	
	
}
