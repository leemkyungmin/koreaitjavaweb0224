package com.koreait.projectE.dao;

public interface LoginDAO {
   
	// 일반 회원가입
	public void customerSignUp(String cId,String cPw,String cName,String cNickname,String cPhone,String cEmail,String cGender);
	
	// 업체 회원가입
	public void deptSignUp(String dSaup_no, String dId, String dPw );
	
	// 아이디 중복체크
	public int idCheck(String cId);
	
}
