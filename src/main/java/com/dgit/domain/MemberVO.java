package com.dgit.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class MemberVO {
	private String u_id;
	private String u_name;
	private String u_pw;
	private String u_phone;
	private String u_email;
	private String u_address;
	private int u_flag;

	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm")
	private Date u_regdate;

	public MemberVO() {

	}

	public MemberVO(String u_id) {
		super();
		this.u_id = u_id;
	}

	public MemberVO(String u_id, String u_name, String u_pw, String u_phone, String u_email, String u_address,
			Date u_regdate) {
		super();
		this.u_id = u_id;
		this.u_name = u_name;
		this.u_pw = u_pw;
		this.u_phone = u_phone;
		this.u_email = u_email;
		this.u_address = u_address;
		this.u_regdate = u_regdate;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getU_pw() {
		return u_pw;
	}

	public void setU_pw(String u_pw) {
		this.u_pw = u_pw;
	}

	public String getU_phone() {
		return u_phone;
	}

	public void setU_phone(String u_phone) {
		this.u_phone = u_phone;
	}

	public String getU_email() {
		return u_email;
	}

	public void setU_email(String u_email) {
		this.u_email = u_email;
	}

	public String getU_address() {
		return u_address;
	}

	public void setU_address(String u_address) {
		this.u_address = u_address;
	}

	public Date getU_regdate() {
		return u_regdate;
	}

	public void setU_regdate(Date u_regdate) {
		this.u_regdate = u_regdate;
	}

	public int getU_flag() {
		return u_flag;
	}

	public void setU_flag(int u_flag) {
		this.u_flag = u_flag;
	}

	@Override
	public String toString() {
		return "MemberVO [u_id=" + u_id + ", u_name=" + u_name + ", u_pw=" + u_pw + ", u_phone=" + u_phone
				+ ", u_email=" + u_email + ", u_address=" + u_address + ", u_flag=" + u_flag + ", u_regdate="
				+ u_regdate + "]";
	}

}
