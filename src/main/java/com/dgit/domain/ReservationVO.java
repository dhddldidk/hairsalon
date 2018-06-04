package com.dgit.domain;

import java.util.Date;

public class ReservationVO {

	private int res_no;
	private Date res_start;
	private Date res_end;
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

	@Override
	public String toString() {
		return "Reservation [res_no=" + res_no + ", res_start=" + res_start + ", res_end=" + res_end + ", hairstyleVo="
				+ hairstyleVo + ", member=" + member + "]";
	}

}
