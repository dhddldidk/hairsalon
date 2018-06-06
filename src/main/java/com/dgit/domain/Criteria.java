package com.dgit.domain;

public class Criteria {

	private int page;//현재 페이지
	private int perPageNum;//페이지에 나타나는 댓글 개수

	public Criteria() {
		
		this.page = 1;
		this.perPageNum = 10;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}

	//만들어 준 함수
	public int getPageStart(){
		return (this.page-1)*this.perPageNum;//this.perPageNum이 10임
	}
	
	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}

}
