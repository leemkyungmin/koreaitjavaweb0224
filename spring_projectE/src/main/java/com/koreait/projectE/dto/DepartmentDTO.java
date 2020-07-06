package com.koreait.projectE.dto;

import java.sql.Date;

public class DepartmentDTO {

	private long dNo,dSeat,dHit,dAccpet;
	private Double dRating;
	private String dPhone,dName,dAddress,dType,dPoto,dStart,dEnd,dParking,dSaup_no;
	private Date dReg_date;
	
	public DepartmentDTO() {}
	
	public DepartmentDTO(long dNo, long dSeat, long dHit, long dAccpet, Double dRating, String dPhone, String dName,
			String dAddress, String dType, String dPoto, String dStart, String dEnd, String dParking, String dSaup_no,
			Date dReg_date) {
		super();
		this.dNo = dNo;
		this.dSeat = dSeat;
		this.dHit = dHit;
		this.dAccpet = dAccpet;
		this.dRating = dRating;
		this.dPhone = dPhone;
		this.dName = dName;
		this.dAddress = dAddress;
		this.dType = dType;
		this.dPoto = dPoto;
		this.dStart = dStart;
		this.dEnd = dEnd;
		this.dParking = dParking;
		this.dSaup_no = dSaup_no;
		this.dReg_date = dReg_date;
	}
	public long getdNo() {
		return dNo;
	}
	public void setdNo(long dNo) {
		this.dNo = dNo;
	}
	public long getdSeat() {
		return dSeat;
	}
	public void setdSeat(long dSeat) {
		this.dSeat = dSeat;
	}
	public long getdHit() {
		return dHit;
	}
	public void setdHit(long dHit) {
		this.dHit = dHit;
	}
	public long getdAccpet() {
		return dAccpet;
	}
	public void setdAccpet(long dAccpet) {
		this.dAccpet = dAccpet;
	}
	public Double getdRating() {
		return dRating;
	}
	public void setdRating(Double dRating) {
		this.dRating = dRating;
	}
	public String getdPhone() {
		return dPhone;
	}
	public void setdPhone(String dPhone) {
		this.dPhone = dPhone;
	}
	public String getdName() {
		return dName;
	}
	public void setdName(String dName) {
		this.dName = dName;
	}
	public String getdAddress() {
		return dAddress;
	}
	public void setdAddress(String dAddress) {
		this.dAddress = dAddress;
	}
	public String getdType() {
		return dType;
	}
	public void setdType(String dType) {
		this.dType = dType;
	}
	public String getdPoto() {
		return dPoto;
	}
	public void setdPoto(String dPoto) {
		this.dPoto = dPoto;
	}
	public String getdStart() {
		return dStart;
	}
	public void setdStart(String dStart) {
		this.dStart = dStart;
	}
	public String getdEnd() {
		return dEnd;
	}
	public void setdEnd(String dEnd) {
		this.dEnd = dEnd;
	}
	public String getdParking() {
		return dParking;
	}
	public void setdParking(String dParking) {
		this.dParking = dParking;
	}
	public String getdSaup_no() {
		return dSaup_no;
	}
	public void setdSaup_no(String dSaup_no) {
		this.dSaup_no = dSaup_no;
	}
	public Date getdReg_date() {
		return dReg_date;
	}
	public void setdReg_date(Date dReg_date) {
		this.dReg_date = dReg_date;
	}
	
	
	
}