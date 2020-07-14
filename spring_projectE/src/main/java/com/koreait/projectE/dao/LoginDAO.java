package com.koreait.projectE.dao;

import java.util.Map;

import com.koreait.projectE.dto.CustomerDTO;
import com.koreait.projectE.dto.DepartmentDTO;
import com.koreait.projectE.dto.DepartmentLoginDTO;

public interface LoginDAO {
   
	// 일반 회원가입
	public void customerSignUp(String cId,String cPw,String cName,String cNickname,String cPhone,String cEmail, String saveFilename, String cGender);
	
	// 업체 회원가입
	public void deptSignUp(String dSaup_no, String dId, String dPw );
	
	// 일반 회원 아이디 중복체크
	public int idCheck(String cId);
	
	// 사업자 아이디 중복체크
	public int deptidCheck(String dId);
	
	// 사업자 번호 중복 체크
	public int dSaup_noCheck(String dSaup_no);
	
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
	
	// 일반 회원 프로필 변경
	public int cPhotoUpdate(String cPhoto, int cNo);
	
	// 사업자 로그인
	public DepartmentLoginDTO departmentLogin(String dId,String dPw);
	
	// 사업자 마이홈
	public DepartmentDTO selectBydSaup_no(String dSaup_no);
	
	// 사업자 비밀번호 변경
	public int deptpwUpdate(String dPw, String dSaup_no);
	
	// 사업자 정보수정 승인요청
	public void departInsert(String dSeat,String dSaup_no,String dPhone,String dName,String dAddress, String dStart, String dEnd, String dParking, String dType, String amuguna );
	
	public void departUpdate(String dSeat,String dSaup_no,String dPhone,String dName,String dAddress, String dStart, String dEnd, String dParking, String dType, String amuguna, String dNo );
	
	public int goDb(String dSaup_no);
	// 사업자 정보수정
	public void departUpdate(String dSeat,String dPhone,String dName,String dAddress, String dStart, String dEnd, String dParking, String dType );

	//사용자 아이디 찾기 
	public String finduId(String cName,String cEmail);
	
	//사용자 비밀번호 찾기 
	public int finduPw(String cId,String cEmail);
	
	//사용자 임시 비밀번호 저장
	public void UpdateTempPw(String cId,String auth);
	
	//업체 아이디 찾기 
	public String find_dept_id(String dSaup_no,String dPhone);
	
	//업체 비밀번호 찾기 
	public int findDeptPw(String dId,String dSaup_no);
	
	// 업체 회원 탈퇴
	public void deptSignOut1(String dSaup_no);
	public void deptSignOut2(String dSaup_no);
	public void deptSignOut3(String dSaup_no);
	public void deptSignOut4(String dSaup_no);
	public void deptSignOut5(String dSaup_no);

	// 일반 회원 탈퇴
	public void customerSignOut1(String cNo);
	public void customerSignOut2(String cNo);
	public void customerSignOut3(String cNo);
	
}
