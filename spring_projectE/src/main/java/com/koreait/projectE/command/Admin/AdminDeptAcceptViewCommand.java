package com.koreait.projectE.command.Admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.projectE.commom.Command;
import com.koreait.projectE.dao.adminDAO;
import com.koreait.projectE.dto.DepartmentDTO;

public class AdminDeptAcceptViewCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		long dNo = Long.parseLong(request.getParameter("dNo"));
		
		adminDAO aDAO = sqlSession.getMapper(adminDAO.class);
		DepartmentDTO deptDTO = aDAO.deptAcceptView(dNo);
		
		model.addAttribute("deptDTO", deptDTO);

	}

}
