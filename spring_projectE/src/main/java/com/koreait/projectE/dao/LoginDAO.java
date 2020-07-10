package com.koreait.projectE.dao;

import com.koreait.projectE.dto.CustomerDTO;

public interface LoginDAO {
   
	// 일반 회원가입
	public void customerSignUp(String cId,String cPw,String cName,String cNickname,String cPhone,String cEmail, String saveFilename, String cGender);
	
	// 업체 회원가입
	public void deptSignUp(String dSaup_no, String dId, String dPw );
	
	// 일반 회원 아이디 중복체크
	public int idCheck(String cId);
	
	// 별명 중복체크
	public int NicknameCheck(String cNickname);
	
	// 일반 회원 이메일 중복체크
	public int emailCheck(String cEmail);
	
	// 일반 회원 로그인
	public CustomerDTO customerLogin(String cId, String cPw);
	
	// 일반 회원 마이홈
	public CustomerDTO selectBycNo(int cNo);
	
	// 일반 회원 비밀번호 변경
	public int pwUpdate(String cPw, int cNo);
	
	// 일반 회원 닉네임 변경
	public int nicknameUpdate(String cNickname, int cNo );
}
