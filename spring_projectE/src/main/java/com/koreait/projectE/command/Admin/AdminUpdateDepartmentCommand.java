package com.koreait.projectE.command.Admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.projectE.commom.Command;
import com.koreait.projectE.dao.adminDAO;
import com.koreait.projectE.dto.DepartmentDTO;

public class AdminUpdateDepartmentCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String dNo = request.getParameter("dNo");
		System.out.println(dNo);
		
		adminDAO aDao = sqlSession.getMapper(adminDAO.class);
		DepartmentDTO dDTO = aDao.UpdateDepartmentPage(dNo);
		model.addAttribute("dDTO", dDTO);
	}

}
