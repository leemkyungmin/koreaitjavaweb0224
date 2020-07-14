package com.koreait.projectE.command.Admin;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.projectE.commom.Command;
import com.koreait.projectE.dao.adminDAO;
import com.koreait.projectE.dto.DepartmentDTO;

public class AdminDeptAcceptCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		adminDAO aDAO = sqlSession.getMapper(adminDAO.class);
		ArrayList<DepartmentDTO> deptList = aDAO.deptAcceptList();
		
		model.addAttribute("deptList", deptList);
	}

}
