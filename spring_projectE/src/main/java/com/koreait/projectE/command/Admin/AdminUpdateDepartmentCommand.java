package com.koreait.projectE.command.Admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.projectE.commom.Command;
import com.koreait.projectE.dao.AdminDAO;
import com.koreait.projectE.dto.DepartmentDTO;

public class AdminUpdateDepartmentCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String dNo = request.getParameter("dNo");
		
		AdminDAO aDao = sqlSession.getMapper(AdminDAO.class);
		DepartmentDTO dDTO = aDao.UpdateDepartmentPage(dNo);
		model.addAttribute("dDTO", dDTO);
	}

}
