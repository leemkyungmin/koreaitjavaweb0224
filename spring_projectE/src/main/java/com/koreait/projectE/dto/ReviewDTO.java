package com.koreait.projectE.dto;

import java.sql.Date;

public class ReviewDTO {

	private int rNo,rPoint,rDepth,rReportCount;
	private String rTitle,rContent,rPoto, rAppointment, dSaup_no,cNickname;
	private Date rWriter_date;
	
	public ReviewDTO() {
		// TODO Auto-generated constructor stub
	}

	public ReviewDTO(int rNo, int rPoint, int rDepth, int rReportCount,String cNickname, String rTitle, String rContent,
			String rPoto, String rAppointment, String dSaup_no, Date rWriter_date) {
		super();
		this.rNo = rNo;
		this.rPoint = rPoint;
		this.rDepth = rDepth;
		this.rReportCount = rReportCount;
		this.cNickname = cNickname;
		this.rTitle = rTitle;
		this.rContent = rContent;
		this.rPoto = rPoto;
		this.rAppointment = rAppointment;
		this.dSaup_no = dSaup_no;
		this.rWriter_date = rWriter_date;
	}

	public int getrNo() {
		return rNo;
	}

	public void setrNo(int rNo) {
		this.rNo = rNo;
	}

	public int getrPoint() {
		return rPoint;
	}

	public void setrPoint(int rPoint) {
		this.rPoint = rPoint;
	}

	public int getrDepth() {
		return rDepth;
	}

	public void setrDepth(int rDepth) {
		this.rDepth = rDepth;
	}

	public int getrReportCount() {
		return rReportCount;
	}

	public void setrReportCount(int rReportCount) {
		this.rReportCount = rReportCount;
	}

	

	public String getcNickname() {
		return cNickname;
	}

	public void setcNickname(String cNickname) {
		this.cNickname = cNickname;
	}

	public String getrTitle() {
		return rTitle;
	}

	public void setrTitle(String rTitle) {
		this.rTitle = rTitle;
	}

	public String getrContent() {
		return rContent;
	}

	public void setrContent(String rContent) {
		this.rContent = rContent;
	}

	public String getrPoto() {
		return rPoto;
	}

	public void setrPoto(String rPoto) {
		this.rPoto = rPoto;
	}

	public String getrAppointment() {
		return rAppointment;
	}

	public void setrAppointment(String rAppointment) {
		this.rAppointment = rAppointment;
	}

	public String getdSaup_no() {
		return dSaup_no;
	}

	public void setdSaup_no(String dSaup_no) {
		this.dSaup_no = dSaup_no;
	}

	public Date getrWriter_date() {
		return rWriter_date;
	}

	public void setrWriter_date(Date rWriter_date) {
		this.rWriter_date = rWriter_date;
	}
	
	
}

