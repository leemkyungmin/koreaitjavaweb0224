package com.koreait.projectE.command;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.projectE.commom.Command;
import com.koreait.projectE.dao.BoardDAO;
import com.koreait.projectE.dto.DepartmentDTO;
import com.koreait.projectE.dto.ReviewDTO;

public class boardViewCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		BoardDAO bdao =sqlSession.getMapper(BoardDAO.class);
		Map<String,Object> map = model.asMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String dSaup_no = request.getParameter("dSaup_no");
		
		model.addAttribute("deptDTO", bdao.DepartView(dSaup_no));
		
		//view 페이지 리뷰 가져오기 
		
		ArrayList<ReviewDTO> reviewList = bdao.reviewList(dSaup_no);
		model.addAttribute("reviewList", reviewList);
		
		
	}

}
