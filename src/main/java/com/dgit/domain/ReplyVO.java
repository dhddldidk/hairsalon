package com.dgit.domain;

import java.util.Date;

public class ReplyVO {

	private int reply_no;
	private int rb_no;
	private String reply_content;
	private String reply_writer;
	private Date reply_date;
	private Date reply_update;

	public int getReply_no() {
		return reply_no;
	}

	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}

	public int getRb_no() {
		return rb_no;
	}

	public void setRb_no(int rb_no) {
		this.rb_no = rb_no;
	}

	public String getReply_content() {
		return reply_content;
	}

	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}

	public String getReply_writer() {
		return reply_writer;
	}

	public void setReply_writer(String reply_writer) {
		this.reply_writer = reply_writer;
	}

	public Date getReply_date() {
		return reply_date;
	}

	public void setReply_date(Date reply_date) {
		this.reply_date = reply_date;
	}

	public Date getReply_update() {
		return reply_update;
	}

	public void setReply_update(Date reply_update) {
		this.reply_update = reply_update;
	}

	@Override
	public String toString() {
		return "ReplyVO [reply_no=" + reply_no + ", rb_no=" + rb_no + ", reply_content=" + reply_content
				+ ", reply_writer=" + reply_writer + ", reply_date=" + reply_date + ", reply_update=" + reply_update
				+ "]";
	}

}
