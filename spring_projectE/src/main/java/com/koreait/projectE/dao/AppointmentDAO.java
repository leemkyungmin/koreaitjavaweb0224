package com.koreait.projectE.dao;

public interface AppointmentDAO {

	// 예약 생성
	public void insertAppointment(String aDate, int aP_count, int cNo, String dSaup_no);

	// 예약 삭제
	
	// 예약 수정
	
	// 예약 인원 검색
	public int selectAp_count(String dSaup_no, String aDate);
}
