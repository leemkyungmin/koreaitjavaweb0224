package com.koreait.projectE.dto;

public class CustomerDTO {

	private int cNo;
	private String cId,cPw,cName,cNickname,cPhone,cEmail,cGrade,cDept,cGender;
	
	public CustomerDTO() {
		// TODO Auto-generated constructor stub
	}

	public CustomerDTO(int cNo, String cId, String cPw, String cName, String cNickname, String cPhone, String cEmail,
			String cGrade, String cDept, String cGender) {
		super();
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
	
	
	
	
	
}       
  