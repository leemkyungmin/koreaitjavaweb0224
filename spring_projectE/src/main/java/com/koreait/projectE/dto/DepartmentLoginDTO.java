package com.koreait.projectE.dto;

public class DepartmentLoginDTO {
	
	String dSaup_no, dId, dPw;
	
	public DepartmentLoginDTO() {
		// TODO Auto-generated constructor stub
	}

	public DepartmentLoginDTO(String dSaup_no, String dId, String dPw) {
		super();
		this.dSaup_no = dSaup_no;
		this.dId = dId;
		this.dPw = dPw;
	}

	public String getdSaup_no() {
		return dSaup_no;
	}

	public void setdSaup_no(String dSaup_no) {
		this.dSaup_no = dSaup_no;
	}

	public String getdId() {
		return dId;
	}

	public void setdId(String dId) {
		this.dId = dId;
	}

	public String getdPw() {
		return dPw;
	}

	public void setdPw(String dPw) {
		this.dPw = dPw;
	}
	
	
	
}
