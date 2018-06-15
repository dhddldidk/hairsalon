package com.dgit.domain;

public class LoginDTO {
	// 회원이 로그인 했나 안했나 확인하기 위해
	private String u_id;
	private String u_name;
	private int u_flag;

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

	public int getU_flag() {
		return u_flag;
	}

	public void setU_flag(int u_flag) {
		this.u_flag = u_flag;
	}

	@Override
	public String toString() {
		return "LoginDTO [u_id=" + u_id + ", u_name=" + u_name + ", u_flag=" + u_flag + "]";
	}

}
