package com.koreait.projectE.command;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.projectE.commom.Command;
import com.koreait.projectE.dao.ListDAO;
import com.koreait.projectE.dto.MainListDTO;

public class ListCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		ListDAO ldao = sqlSession.getMapper(ListDAO.class);
		
		ArrayList<MainListDTO> list = ldao.main_list();
		System.out.println(list.get(0).getCount());
		model.addAttribute("list", list);
		 
		
		
	}

}
