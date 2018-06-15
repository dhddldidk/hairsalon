package com.dgit.domain;

import java.util.Date;

public class ReservationVO {

	private int res_no;
	private Date res_start;
	private Date res_end;
	private boolean res_usage;// 이용여부
	private HairStyleVO hairstyleVo;
	private MemberVO member;

	public int getRes_no() {
		return res_no;
	}

	public void setRes_no(int res_no) {
		this.res_no = res_no;
	}

	public Date getRes_start() {
		return res_start;
	}

	public void setRes_start(Date res_start) {
		this.res_start = res_start;
	}

	public Date getRes_end() {
		return res_end;
	}

	public void setRes_end(Date res_end) {
		this.res_end = res_end;
	}

	public HairStyleVO getHairstyleVo() {
		return hairstyleVo;
	}

	public void setHairstyleVo(HairStyleVO hairstyleVo) {
		this.hairstyleVo = hairstyleVo;
	}

	public MemberVO getMember() {
		return member;
	}

	public void setMember(MemberVO member) {
		this.member = member;
	}

	public boolean isRes_usage() {
		return res_usage;
	}

	public void setRes_usage(boolean res_usage) {
		this.res_usage = res_usage;
	}

	@Override
	public String toString() {
		return "ReservationVO [res_no=" + res_no + ", res_start=" + res_start + ", res_end=" + res_end + ", res_usage="
				+ res_usage + ", hairstyleVo=" + hairstyleVo + ", member=" + member + "]";
	}

}
