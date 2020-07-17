package com.koreait.projectE.dao;

public interface ReviewDAO {

	// 리뷰 생성
	public void insertReview(String rTitle, String rContent, int rPoint, String rPoto, int cNo, String dSaup_no);
	
	// 리뷰 수정
	public void updateReview(String rTitle, String rContent, int rPoint, String rPoto, int cNo, String dSaup_no,int rNo);
	// 리뷰 삭제
	
	// 리뷰 수정
	
}
