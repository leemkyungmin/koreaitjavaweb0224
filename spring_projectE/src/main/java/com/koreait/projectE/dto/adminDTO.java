package com.koreait.projectE.dto;

import java.sql.Date;

public class adminDTO {

	private long dNo,dSeat,dHit,dRating,dAccpet;
	private int cNo;
	private String cId,cPw,cName,cNickname,cPhone,cEmail,cGrade,cDept,cGender,dPhone,dName,dAddress,dType,dPoto,dStart,dEnd,dParking,dSaup_no;
	private Date dReg_date;
	
	public adminDTO() {
			
	}

	public adminDTO(long dNo, long dSeat, long dHit, long dRating, long dAccpet, int cNo, String cId, String cPw,
			String cName, String cNickname, String cPhone, String cEmail, String cGrade, String cDept, String cGender,
			String dPhone, String dName, String dAddress, String dType, String dPoto, String dStart, String dEnd,
			String dParking, String dSaup_no, Date dReg_date) {
		super();
		this.dNo = dNo;
		this.dSeat = dSeat;
		this.dHit = dHit;
		this.dRating = dRating;
		this.dAccpet = dAccpet;
		this.cNo = cNo;
		this.cId = cId;
		this.cPw = cPw;
		this.cName = cName;
		this.cNickname = cNickname;
		this.cPhone = cPhone;
		this.cEmail = cEmail;
		this.cGrade = cGrade;
		this.cDept = cDept;
		this.cGender = cGender;
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

	public long getdRating() {
		return dRating;
	}

	public void setdRating(long dRating) {
		this.dRating = dRating;
	}

	public long getdAccpet() {
		return dAccpet;
	}

	public void setdAccpet(long dAccpet) {
		this.dAccpet = dAccpet;
	}

	public int getcNo() {
		return cNo;
	}

	public void setcNo(int cNo) {
		this.cNo = cNo;
	}

	public String getcId() {
		return cId;
	}

	public void setcId(String cId) {
		this.cId = cId;
	}

	public String getcPw() {
		return cPw;
	}

	public void setcPw(String cPw) {
		this.cPw = cPw;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public String getcNickname() {
		return cNickname;
	}

	public void setcNickname(String cNickname) {
		this.cNickname = cNickname;
	}

	public String getcPhone() {
		return cPhone;
	}

	public void setcPhone(String cPhone) {
		this.cPhone = cPhone;
	}

	public String getcEmail() {
		return cEmail;
	}

	public void setcEmail(String cEmail) {
		this.cEmail = cEmail;
	}

	public String getcGrade() {
		return cGrade;
	}

	public void setcGrade(String cGrade) {
		this.cGrade = cGrade;
	}

	public String getcDept() {
		return cDept;
	}

	public void setcDept(String cDept) {
		this.cDept = cDept;
	}

	public String getcGender() {
		return cGender;
	}

	public void setcGender(String cGender) {
		this.cGender = cGender;
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
