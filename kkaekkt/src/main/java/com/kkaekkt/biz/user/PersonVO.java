package com.kkaekkt.biz.user;

public class PersonVO extends AccountVO {
	private int birth;
	private int state=1; //기본값 (작업전)

	public int getBirth() {
		return birth;
	}
	
	public void setBirth(int birth) {
		this.birth = birth;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "PersonVO [birth=" + birth + ", state=" + state + ", getId()=" + getId()
				+ ", getPassword()=" + getPassword() + ", getName()=" + getName() + ", getPhone()=" + getPhone()
				+ ", getAddress()=" + getAddress() + ", getEmail()=" + getEmail() + "]";
	}

	
}
