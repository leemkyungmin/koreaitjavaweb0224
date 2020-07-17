package com.koreait.projectE.command.Board;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.projectE.commom.Command;
import com.koreait.projectE.dao.BoardDAO;
import com.koreait.projectE.dto.DepartmentDTO;

public class reviewWriteCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map  =model.asMap();
		HttpServletRequest request =(HttpServletRequest) map.get("request");

		String dSaup_no = request.getParameter("dSaup_no");
		int cNo = Integer.parseInt(request.getParameter("cNo"));
		
		
		BoardDAO bdao = sqlSession.getMapper(BoardDAO.class);
		DepartmentDTO deptDTO = bdao.DepartView(dSaup_no);
			
		model.addAttribute("deptDTO", deptDTO);
		model.addAttribute("cNo", cNo);
		
		
	}

}
