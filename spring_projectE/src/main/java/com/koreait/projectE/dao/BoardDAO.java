package com.koreait.projectE.dao;

import java.util.ArrayList;

import com.koreait.projectE.dto.DepartmentDTO;
import com.koreait.projectE.dto.ReviewDTO;

public interface BoardDAO {
   
	public DepartmentDTO DepartView(String dSaup_no);

	public ArrayList<ReviewDTO> reviewList(String dSaup_no);
}
