package com.dgit.domain;

public class HairStyleVO {

	private int hair_no;
	private String hair_type;
	private int hair_time;
	private int hair_price;

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

	@Override
	public String toString() {
		return "HairStyleVO [hair_no=" + hair_no + ", hair_type=" + hair_type + ", hair_time=" + hair_time
				+ ", hair_price=" + hair_price + "]";
	}

}
