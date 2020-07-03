package com.koreait.projectE.dto;

public class MenuDTO {
	
	private int mNo;
	private String mName,mPrice;
	private String dSaup_no;
	
	public MenuDTO() {
		
	}

	public MenuDTO(int mNo, String mName, String mPrice, String dSaup_no) {
		super();
		this.mNo = mNo;
		this.mName = mName;
		this.mPrice = mPrice;
		this.dSaup_no = dSaup_no;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getmPrice() {
		return mPrice;
	}

	public void setmPrice(String mPrice) {
		this.mPrice = mPrice;
	}

	public String getdSaup_no() {
		return dSaup_no;
	}

	public void setdSaup_no(String dSaup_no) {
		this.dSaup_no = dSaup_no;
	}
	
	
	
}
