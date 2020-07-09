package com.koreait.projectE.dto;

public class AppointmentDTO {
	
	private int aNo, aP_count, cNo;
	private String aDate, dSaup_no;
	
	public AppointmentDTO() {
		// TODO Auto-generated constructor stub
	}

	public AppointmentDTO(int aNo, int aP_count, int cNo, String aDate, String dSaup_no) {
		super();
		this.aNo = aNo;
		this.aP_count = aP_count;
		this.cNo = cNo;
		this.aDate = aDate;
		this.dSaup_no = dSaup_no;
	}

	public int getaNo() {
		return aNo;
	}

	public void setaNo(int aNo) {
		this.aNo = aNo;
	}

	public int getaP_count() {
		return aP_count;
	}

	public void setaP_count(int aP_count) {
		this.aP_count = aP_count;
	}

	public int getcNo() {
		return cNo;
	}

	public void setcNo(int cNo) {
		this.cNo = cNo;
	}

	public String getaDate() {
		return aDate;
	}

	public void setaDate(String aDate) {
		this.aDate = aDate;
	}

	public String getdSaup_no() {
		return dSaup_no;
	}

	public void setdSaup_no(String dSaup_no) {
		this.dSaup_no = dSaup_no;
	}
	
}
