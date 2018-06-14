package com.dgit.domain;

import java.util.Arrays;

public class HairStyleVO {

	private int hair_no;
	private String hair_type;
	private int hair_time;
	private int hair_price;
	private String[] hFiles;
	private String hair_filename;
	
	public HairStyleVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public HairStyleVO(int hair_no) {
		super();
		this.hair_no = hair_no;
	}

	public int getHair_no() {
		return hair_no;
	}

	public void setHair_no(int hair_no) {
		this.hair_no = hair_no;
	}

	public String getHair_type() {
		return hair_type;
	}

	public void setHair_type(String hair_type) {
		this.hair_type = hair_type;
	}

	public int getHair_time() {
		return hair_time;
	}

	public void setHair_time(int hair_time) {
		this.hair_time = hair_time;
	}

	public int getHair_price() {
		return hair_price;
	}

	public void setHair_price(int hair_price) {
		this.hair_price = hair_price;
	}

	public String[] gethFiles() {
		return hFiles;
	}

	public void sethFiles(String[] hFiles) {
		this.hFiles = hFiles;
	}

	
	public String getHair_filename() {
		return hair_filename;
	}

	public void setHair_filename(String hair_filename) {
		this.hair_filename = hair_filename;
	}

	@Override
	public String toString() {
		return "HairStyleVO [hair_no=" + hair_no + ", hair_type=" + hair_type + ", hair_time=" + hair_time
				+ ", hair_price=" + hair_price + ", hFiles=" + Arrays.toString(hFiles) + ", hair_filename="
				+ hair_filename + "]";
	}

	

}
