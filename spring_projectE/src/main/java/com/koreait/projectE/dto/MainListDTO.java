package com.koreait.projectE.dto;

public class MainListDTO {

	private String dong;
	private int count;
	
	public MainListDTO() {
		
	}

	public MainListDTO(String dong, int count) {
		super();
		this.dong = dong;
		this.count = count;
	}

	public String getDong() {
		return dong;
	}

	public void setDong(String dong) {
		this.dong = dong;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	
}
