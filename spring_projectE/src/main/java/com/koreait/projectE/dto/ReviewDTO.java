	package com.koreait.projectE.dto;

import java.sql.Date;

public class ReviewDTO {

	private int rNo,rPoint,rDepth,rReportCount,cName,rAppointment;
	private double Rating;
	private String rTitle,rContent,rPoto;
	private Date rWriter_date;
	
	public ReviewDTO() {
		
	}

	public ReviewDTO(double Rating,int rNo, int rPoint, int rDepth, int rReportCount, int cName,int rAppointment, String rTitle, String rContent,
			String rPoto, Date rWriter_date) {
		super();
		this.rAppointment=rAppointment;
		this.Rating=Rating;
		this.rNo = rNo;
		this.rPoint = rPoint;
		this.rDepth = rDepth;
		this.rReportCount = rReportCount;
		this.cName = cName;
		this.rTitle = rTitle;
		this.rContent = rContent;
		this.rPoto = rPoto;
		this.rWriter_date = rWriter_date;
	}
	
	public int getrAppointment() {
		return rAppointment;
	}

	public void setrAppointment(int rAppointment) {
		this.rAppointment = rAppointment;
	}

	public double getRating() {
		return Rating;
	}

	public void setRating(double rating) {
		Rating = rating;
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

	public int getcName() {
		return cName;
	}

	public void setcName(int cName) {
		this.cName = cName;
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

	public Date getrWriter_date() {
		return rWriter_date;
	}

	public void setrWriter_date(Date rWriter_date) {
		this.rWriter_date = rWriter_date;
	}
	
	
	
}

