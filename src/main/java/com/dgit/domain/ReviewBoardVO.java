package com.dgit.domain;

import java.util.Date;

public class ReviewBoardVO {

	private int rb_no;
	private String rb_title;
	private String rb_context;
	private String rb_writer;
	private Date rb_regdate;
	private int rb_viewcnt;
	private int rb_replycnt;

	public int getRb_no() {
		return rb_no;
	}

	public void setRb_no(int rb_no) {
		this.rb_no = rb_no;
	}

	public String getRb_title() {
		return rb_title;
	}

	public void setRb_title(String rb_title) {
		this.rb_title = rb_title;
	}

	public String getRb_context() {
		return rb_context;
	}

	public void setRb_context(String rb_context) {
		this.rb_context = rb_context;
	}

	public String getRb_writer() {
		return rb_writer;
	}

	public void setRb_writer(String rb_writer) {
		this.rb_writer = rb_writer;
	}

	public Date getRb_regdate() {
		return rb_regdate;
	}

	public void setRb_regdate(Date rb_regdate) {
		this.rb_regdate = rb_regdate;
	}

	public int getRb_viewcnt() {
		return rb_viewcnt;
	}

	public void setRb_viewcnt(int rb_viewcnt) {
		this.rb_viewcnt = rb_viewcnt;
	}

	public int getRb_replycnt() {
		return rb_replycnt;
	}

	public void setRb_replycnt(int rb_replycnt) {
		this.rb_replycnt = rb_replycnt;
	}

	@Override
	public String toString() {
		return "ReviewBoardVO [rb_no=" + rb_no + ", rb_title=" + rb_title + ", rb_context=" + rb_context
				+ ", rb_writer=" + rb_writer + ", rb_regdate=" + rb_regdate + ", rb_viewcnt=" + rb_viewcnt
				+ ", rb_replycnt=" + rb_replycnt + "]";
	}

	
}
