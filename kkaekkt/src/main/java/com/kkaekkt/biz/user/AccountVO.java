package com.kkaekkt.biz.user;

public class AccountVO {
	private int mno;
	private int bno;
    private String id;
	private String password;
    private String name;
    private String phone;
    private String address;
    private String email;
    private int emailchk;
    private int mtype=1;
    private int idchk;
    private String ip;
    
    // 테스트용
    private int stno; 
    
    public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public int getStno() {
		return stno;
	}
	public void setStno(int stno) {
		this.stno = stno;
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
	public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public void setMname(String mname) {
    	this.name = mname;
    }
    public void setBname(String bname) {
    	this.name = bname;
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
    public int getMtype() {
        return mtype;
    }
    public void setMtype(int mtype) {
        this.mtype = mtype;
    }
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getEmailchk() {
		return emailchk;
	}
	public void setEmailchk(int emailchk) {
		this.emailchk = emailchk;
	}
	public void setBmail(String bmail) {
		this.email = bmail;
	}
	public void setMmail(String mmail) {
		this.email = mmail;
	}
	public int getIdchk() {
		return idchk;
	}
	public void setIdchk(int idchk) {
		this.idchk = idchk;
	}
	@Override
	public String toString() {
		return "AccountVO [mno=" + mno + ", bno=" + bno + ", id=" + id + ", password=" + password + ", name=" + name
				+ ", phone=" + phone + ", address=" + address + ", email=" + email + ", emailchk=" + emailchk
				+ ", mtype=" + mtype + ", idchk=" + idchk + ", ip=" + ip + ", stno=" + stno + "]";
	}
	
	
}
