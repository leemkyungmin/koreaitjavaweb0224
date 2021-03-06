package com.koreait.projectE.command.Board;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.projectE.commom.Command;
import com.koreait.projectE.dao.BoardDAO;
import com.koreait.projectE.dto.DepartmentDTO;
import com.koreait.projectE.dto.ReviewDTO;

public class ReviewDetailCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		// TODO Auto-generated method stub
		
		Map<String,Object> map = model.asMap();
		HttpServletRequest request =(HttpServletRequest) map.get("request");
		int rNo= Integer.parseInt(request.getParameter("rNo"));
		System.out.println(rNo);
		BoardDAO bdao = sqlSession.getMapper(BoardDAO.class);
		ReviewDTO rdto =bdao.reivewDetail(rNo);
		DepartmentDTO deptdto = bdao.DepartView(rdto.getdSaup_no());
		model.addAttribute("rdto", rdto);
		model.addAttribute("deptdto", deptdto); 
		
	}

}
