package com.koreait.projectE.command;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.projectE.commom.Command;
import com.koreait.projectE.dao.adminDAO;
import com.koreait.projectE.dto.CustomerDTO;
import com.koreait.projectE.dto.DepartmentDTO;

public class AdminCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		adminDAO adao = sqlSession.getMapper(adminDAO.class);
		
		
		ArrayList<CustomerDTO> cList = adao.getCustomList();
		System.out.println(cList.size());
		model.addAttribute("cList", cList);
			
		ArrayList<DepartmentDTO> dList = adao.getDepartmentList();
		System.out.println(dList.size());
		model.addAttribute("dList", dList);

		
		
	}
	
	
	
	
	

}
