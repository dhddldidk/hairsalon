package com.dgit.domain;

public class ChartVO {

	private int morning;
	private int afternoon;
	private int evening;
	private String month;

	public int getMorning() {
		return morning;
	}

	public void setMorning(int morning) {
		this.morning = morning;
	}

	public int getAfternoon() {
		return afternoon;
	}

	public void setAfternoon(int afternoon) {
		this.afternoon = afternoon;
	}

	public int getEvening() {
		return evening;
	}

	public void setEvening(int evening) {
		this.evening = evening;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	@Override
	public String toString() {
		return "ChartVO [morning=" + morning + ", afternoon=" + afternoon + ", evening=" + evening + ", month=" + month
				+ "]";
	}

}
