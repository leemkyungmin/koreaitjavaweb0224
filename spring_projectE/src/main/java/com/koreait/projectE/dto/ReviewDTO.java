package com.koreait.projectE.dto;

import java.sql.Date;

public class ReviewDTO {

	private long rNo,rPoint,rDepth,rReportCount,cName;
	private String rTitle,rContent,rPoto;
	private Date rWriter_date;
	
	public ReviewDTO() {
		
	}

	public ReviewDTO(long rNo, long rPoint, long rDepth, long rReportCount, long cName, String rTitle, String rContent,
			String rPoto, Date rWriter_date) {
		super();
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

	public long getrNo() {
		return rNo;
	}

	public void setrNo(int rNo) {
		this.rNo = rNo;
	}

	public long getrPoint() {
		return rPoint;
	}

	public void setrPoint(int rPoint) {
		this.rPoint = rPoint;
	}

	public long getrDepth() {
		return rDepth;
	}

	public void setrDepth(int rDepth) {
		this.rDepth = rDepth;
	}

	public long getrReportCount() {
		return rReportCount;
	}

	public void setrReportCount(int rReportCount) {
		this.rReportCount = rReportCount;
	}

	public long getcName() {
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

