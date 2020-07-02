package com.koreait.mybatis04.dto;

import java.sql.Date;

public class ImageBoardDTO {

	private int iNo;
	private String iWriter,iFilename,iTitle,iContent;
	private Date iRegdate;
	
	public ImageBoardDTO() {}

	public ImageBoardDTO(int iNo, String iWriter, String iFilename, String iTitle, String iContent, Date iRegdate) {
		super();
		this.iNo = iNo;
		this.iWriter = iWriter;
		this.iFilename = iFilename;
		this.iTitle = iTitle;
		this.iContent = iContent;
		this.iRegdate = iRegdate;
	}

	public int getiNo() {
		return iNo;
	}

	public void setiNo(int iNo) {
		this.iNo = iNo;
	}

	public String getiWriter() {
		return iWriter;
	}

	public void setiWriter(String iWriter) {
		this.iWriter = iWriter;
	}

	public String getiFilename() {
		return iFilename;
	}

	public void setiFilename(String iFilename) {
		this.iFilename = iFilename;
	}

	public String getiTitle() {
		return iTitle;
	}

	public void setiTitle(String iTitle) {
		this.iTitle = iTitle;
	}

	

	public String getiContent() {
		return iContent;
	}

	public void setiContent(String iContent) {
		this.iContent = iContent;
	}

	public Date getiRegdate() {
		return iRegdate;
	}

	public void setiRegdate(Date iRegdate) {
		this.iRegdate = iRegdate;
	}
	
	
}
