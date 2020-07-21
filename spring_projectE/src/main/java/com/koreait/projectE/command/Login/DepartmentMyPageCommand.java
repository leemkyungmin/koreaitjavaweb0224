package com.koreait.projectE.command.Login;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.projectE.commom.Command;
import com.koreait.projectE.dao.BoardDAO;
import com.koreait.projectE.dao.LoginDAO;
import com.koreait.projectE.dto.DepartmentDTO;

public class DepartmentMyPageCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpSession session = request.getSession();
		String dSaup_no = (String) session.getAttribute("dSaup_no");
		
		LoginDAO lDAO = sqlSession.getMapper(LoginDAO.class);
		BoardDAO bDAO = sqlSession.getMapper(BoardDAO.class);
		
		DepartmentDTO bDTO = lDAO.selectBydSaup_no(dSaup_no);
		if(bDTO !=null) {
			
			String dStart = (bDTO.getdStart().substring(0, 2) +":"+ bDTO.getdStart().substring(2,4));
			String dEnd = (bDTO.getdEnd().substring(0,2) +":"+ bDTO.getdEnd().substring(2,4));
			bDTO.setdStart(dStart);
			bDTO.setdEnd(dEnd);
		}
		model.addAttribute("dDTO",bDTO );
		model.addAttribute("bDTO", bDAO.menuList(dSaup_no));
	}

}
